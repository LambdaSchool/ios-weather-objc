//
//  IIIForecastController.m
//  WeatherObjC
//
//  Created by Ryan Murphy on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//1340d66bb372ff93adebd79d41eea048

#import "IIIForecastController.h"
#import "IIIForecast.h"

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKey = @"1340d66bb372ff93adebd79d41eea048";

@implementation IIIForecastController

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
//                                          [NSURLQueryItem queryItemWithName: @"units" value: @"imperial"],
                                          [NSURLQueryItem queryItemWithName: @"appid" value: apiKey]
                                          ] mutableCopy];
    
    components.queryItems = searchComponents;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [components URL]];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
            completionBlock(error);
            return;
        }
        
        NSError *jsonError;
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData: data options: 0 error: &jsonError];
        
        if (!dictionary) {
            NSLog(@"Error Here check here: %@", jsonError);
            completionBlock(jsonError);
            return;
        }
        
        NSString *cityName = dictionary[@"city"][@"name"];
        
        NSArray *list = dictionary[@"list"];
        
        for (NSDictionary *dictionary in list) {
            IIIForecast *dailyForecast = [[IIIForecast alloc] initWithDictionary: dictionary cityName: cityName];
            [[self forecasts] addObject: dailyForecast];
        }
        completionBlock(nil);
    }];
    
    [task resume];
}

@end

