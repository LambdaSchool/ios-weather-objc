//
//  IIIForecastController.m
//  WeatherObjC
//
//  Created by Jeffrey Santana on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecastController.h"
#import "IIIWeatherApiKey.h"
#import "IIIForecast.h"

@implementation IIIForecastController

static NSString *baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";

- (instancetype)init
{
	self = [super init];
	if (self) {
		_apiKey = [[IIIWeatherApiKey alloc] init];
	}
	return self;
}

- (void)fetchForecastForCity:(NSString *)city completitionBlock:(myCompletion)completionBlock {
	NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
	
	NSArray *queryItems = @[
		[NSURLQueryItem queryItemWithName:@"q" value:city],
		[NSURLQueryItem queryItemWithName:@"cnt" value:@"7"],
		[NSURLQueryItem queryItemWithName:@"appid" value:self.apiKey.apiKey],
	];
	
    urlComponents.queryItems = queryItems;
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
	
	NSURLSessionDataTask *task =
	[[NSURLSession sharedSession] dataTaskWithURL:url
								completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
		
		if (error) {
			NSLog(@"Error fetching forecast: %@", error);
			completionBlock(NO);
			return;
		}
		
		// parse the data
		NSError *jsonError = nil;
		NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		if (jsonError) {
			NSLog(@"JSON Error: %@", jsonError);
			completionBlock(NO);
			return;
		}
		
		NSLog(@"JSON: %@", json);
		
		NSString *city = json[@"city"][@"name"];		
		NSArray *zipForecast = json[@"list"];
		
		for (NSDictionary *dailyForecast in zipForecast) {
			IIIForecast *forecast = [[IIIForecast alloc] initWithDict:dailyForecast andCity:city];
			
			if (forecast) {
				[self.forecastArray addObject:forecast];
			}
		}
		
		completionBlock(YES);
	}];
	[task resume];
}

@end
