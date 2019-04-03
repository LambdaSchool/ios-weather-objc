//
//  IIIDailyForecastController.m
//  WeatherObjC
//
//  Created by Nathanael Youngren on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIDailyForecastController.h"
#import "IIIDailyForecast.h"

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKey = @"1340d66bb372ff93adebd79d41eea048";

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
    
    NSURL *baseURL = [NSURL URLWithString: baseURLString];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL: baseURL resolvingAgainstBaseURL: true];
    
    NSMutableArray *searchComponents = [@[[NSURLQueryItem queryItemWithName: @"zip" value: zipCode],
                                          [NSURLQueryItem queryItemWithName: @"appid" value: apiKey]
                                          ] mutableCopy];
    
    components.queryItems = searchComponents;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [components URL]];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
   
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
            [[self forecasts] addObject: dailyForecast];
        }
        completionBlock(nil);
    }];
    
    [task resume];
}

@end
