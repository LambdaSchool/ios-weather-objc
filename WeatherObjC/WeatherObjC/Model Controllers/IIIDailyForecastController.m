//
//  IIIDailyForecastController.m
//  WeatherObjC
//
//  Created by Nathanael Youngren on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIDailyForecastController.h"
#import "IIIDailyForecast.h"

static NSString *baseURL = @"https://samples.openweathermap.org/data/2.5/forecast/daily";
static NSString *apiKey = @"84e6e3f3e59a02ca63f83566562cf881";

@implementation IIIDailyForecastController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [@[] mutableCopy];
    }
    return self;
}

- (void)fetchForecastsWithZipCode:(NSString *)zipCode completion:(IIIDailyForecastFetcherCompletionBlock)completionBlock {
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString: baseURL];
    
    NSMutableArray *searchComponents = [@[[NSURLQueryItem queryItemWithName: @"zip" value: zipCode],
                                          [NSURLQueryItem queryItemWithName: @"apiid" value: apiKey]
                                          ] mutableCopy];
    
    components.queryItems = searchComponents;
    
    NSURL *url = [components URL];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (error) {
            NSLog(@"Error fetching weaker: %@", error);
            completionBlock(error);
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData: data options: 0 error: &jsonError];
        
        if (!dictionary) {
            NSLog(@"Error decoding dictionary: %@", jsonError);
            completionBlock(jsonError);
            return;
        }
        
        NSString *cityName = dictionary[@"city"][@"name"];
        
        NSArray *list = dictionary[@"list"];
        
        for (NSDictionary *dictionary in list) {
            IIIDailyForecast *dailyForecast = [[IIIDailyForecast alloc] initWithDictionary: dictionary cityName: cityName];
            [self.forecasts addObject: dailyForecast];
        }
    }];
    
    [task resume];
}

@end
