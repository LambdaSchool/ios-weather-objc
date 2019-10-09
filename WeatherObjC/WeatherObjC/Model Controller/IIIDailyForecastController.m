//
//  IIIDailyForecastController.m
//  WeatherObjC
//
//  Created by Michael Redig on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIDailyForecastController.h"
#import "IIIDailyForecast.h"

@implementation IIIDailyForecastController

static const NSString* baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static const NSString* apiKey = @"f641060b2a95d6cca0d96a5230be574b";

- (instancetype)init {
	if (self = [super init]) {
		_forecasts = @[];
	}
	return self;
}

- (void)fetchForecastsFrom:(NSString*)zipCode completionBlock:(IIIDailyForecastCompletionBlock)completionBlock {

	NSURLComponents* components = [[NSURLComponents alloc] initWithString:baseURLString];

	NSString* zipComposed = [NSString stringWithFormat:@"%@,us", zipCode];
	NSArray* queryItems = @[
		[NSURLQueryItem queryItemWithName:@"cnt" value:@"7"],
		[NSURLQueryItem queryItemWithName:@"appid" value:apiKey],
		[NSURLQueryItem queryItemWithName:@"zip" value:zipComposed],
		[NSURLQueryItem queryItemWithName:@"units" value:@"imperial"],
	];
	components.queryItems = queryItems;

	NSURL* url = components.URL;

	NSURLSessionDataTask* dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {

		if (error) {
			NSLog(@"Error retrieving data: %@", error);
			completionBlock(nil, error);
			return;
		}

		NSError *jsonError = nil;
		NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		if (jsonError) {
			NSLog(@"JSON Error: %@", jsonError);
			completionBlock(nil, jsonError);
			return;
		}

		NSDictionary* city = jsonDict[@"city"];
		NSString* cityName = city[@"name"];

		NSArray* list = jsonDict[@"list"];
		NSMutableArray* forecasts = [NSMutableArray array];
		for (NSDictionary* listItem in list) {
			IIIDailyForecast* forecastItem = [IIIDailyForecast forecastWithCityNamed:cityName withDictionaryRepresentation:listItem];

			if (forecastItem != nil) {
				[forecasts addObject:forecastItem];
			}
		}

		self.forecasts = [NSArray arrayWithArray:forecasts];
		completionBlock(forecasts, nil);
	}];
	[dataTask resume];
}

@end
