//
//  IIIForecastController.m
//  WeatherObjC
//
//  Created by Jeffrey Santana on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecastController.h"
#import "IIIWeatherApiKey.h"

@implementation IIIForecastController

static NSString *baseURLString = @"api.openweathermap.org/data/2.5/forecast/daily";
//?id={city ID}&cnt={cnt}";

- (instancetype)init
{
	self = [super init];
	if (self) {
		_apiKey = [[IIIWeatherApiKey alloc] init];
	}
	return self;
}

- (void)fetchForecastForCity:(NSString *)cityId completitionBlock:(ForecastCompletionBlock)completionBlock {
	NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
	
	NSArray *queryItems = @[
		[NSURLQueryItem queryItemWithName:@"zip" value:cityId],
		[NSURLQueryItem queryItemWithName:@"appid" value:self.apiKey.apiKey],
	];
	
    urlComponents.queryItems = queryItems;
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
	
	NSURLSessionDataTask *task =
	[[NSURLSession sharedSession] dataTaskWithURL:url
								completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
		
		if (error) {
			NSLog(@"Error fetching quakes: %@", error);
			completionBlock(nil, error);
			return;
		}
		
		// parse the data
		NSError *jsonError = nil;
		NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		if (jsonError) {
			NSLog(@"JSON Error: %@", jsonError);
			completionBlock(nil, jsonError);
			return;
		}
		
		NSLog(@"JSON: %@", json);
		
		completionBlock(json, nil);
	}];
	[task resume];
}

@end
