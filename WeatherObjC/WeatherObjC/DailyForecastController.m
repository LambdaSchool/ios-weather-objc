//
//  DailyForecastController.m
//  WeatherObjC
//
//  Created by Daniela Parra on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "DailyForecastController.h"
#import "DailyForecast.h"

@implementation DailyForecastController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [[NSArray alloc] init];
    }
    return self;
}

- (void)getDailyForecastsFor:(NSString *)zipcode completion:(void (^)(NSArray * _Nullable, NSError * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLQueryItem *searchItem = [[NSURLQueryItem alloc] initWithName:@"zip" value:zipcode];
    
    NSURLQueryItem *apiKeyItem = [[NSURLQueryItem alloc] initWithName:@"appid" value:APIKey];
    
    NSURLQueryItem *unitsItem = [[NSURLQueryItem alloc] initWithName:@"units" value:@"imperial"];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    [components setQueryItems:@[searchItem, apiKeyItem, unitsItem]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:components.URL];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error searching for person: %@", error);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data returned from data task");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON is not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSDictionary *cityDictionary = dictionary[@"city"];
        NSString *cityName = cityDictionary[@"name"];
        
        NSArray *list = dictionary[@"list"];
        
        
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        for (NSDictionary *forecastDictionary in list) {
            
            DailyForecast *dailyForecast = [[DailyForecast alloc] initWithDictionary:forecastDictionary cityName:cityName];
            
            [forecasts addObject:dailyForecast];
        }
        
        completion(forecasts, nil);
        
    }] resume];
}

static NSString * const baseURLString = @"https://samples.openweathermap.org/data/2.5/forecast/daily";

static NSString * const APIKey = @"1a5791217ce93886ef63386d3a79891c";

@end
