//
//  IIIForecastFetcher.m
//  WeatherObjC
//
//  Created by Michael Stoffer on 11/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecastFetcher.h"
#import "IIIForecast.h"

static NSString *ForecastFetcherBaseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString *key = @"96e7fb979b9a0d14d2aee9c916a901fd";

@implementation IIIForecastFetcher

- (instancetype)init
{
    if (self = [super init]) {
        _forecasts = [[NSArray alloc] init];
    }
    return self;
}

- (void)fetchForecasts:(NSString *)city completionHandler:(ForecastFetcherCompletionHandler)completionHandler
{
    NSURLComponents *URLComponents = [[NSURLComponents alloc] initWithString:ForecastFetcherBaseURLString];
    
    NSMutableArray *queryItems = [NSMutableArray arrayWithObjects:
                                  [NSURLQueryItem queryItemWithName:@"q" value:city],
                                  [NSURLQueryItem queryItemWithName:@"cnt" value:@"7"],
                                  [NSURLQueryItem queryItemWithName:@"APPID" value:key], nil];
    
    URLComponents.queryItems = queryItems;
    NSURL *URL = URLComponents.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching forecasts: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!results) {
            NSLog(@"Error decoding json: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            
            return;
        }
        
        NSLog(@"%@", results);
        
        NSString *city = [[results objectForKey:@"city"] objectForKey:@"name"];
        NSArray *forecastDictionaries = [results objectForKey:@"list"];
        
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dictionary in forecastDictionaries) {
            IIIForecast *forecast = [[IIIForecast alloc] initWithDictionary:dictionary Name:city];
            [forecasts addObject:forecast];
        }
        
        self.forecasts = forecasts;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(forecasts, nil);
        });
    }] resume];
}

@end
