//
//  CGAForecastController.m
//  WeatherObjC
//
//  Created by Conner on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "CGAForecastController.h"
#import "CGAForecast.h"

@implementation CGAForecastController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)searchForForecastWithZipcode:(NSString *)zipcode completion:(void (^)(NSMutableArray *forecastsFromZipcode, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *zipcodeItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipcode];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"appid" value:apiKey];
    NSURLQueryItem *imperialUnitItem = [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"];
    [components setQueryItems:@[zipcodeItem, apiKeyItem, imperialUnitItem]];
    
    NSURL *url = [components URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching data from weather API: %@", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON is not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSString *cityName = dictionary[@"city"][@"name"];
        NSArray *forecasts = dictionary[@"list"];
        
        for (NSDictionary *forecastTemp in forecasts) {
            NSString *forecastIconId = forecastTemp[@"weather"][0][@"icon"];
            NSString *forecastDayTemp = forecastTemp[@"temp"][@"day"];
            CGAForecast *forecast = [[CGAForecast alloc]
                                     initWithCity:cityName
                                     temperature:forecastDayTemp
                                     forecastIcon: [UIImage imageNamed: forecastIconId]];
            [[self forecasts] addObject:forecast];
        }
        
        completion([self forecasts], nil);
        
    }] resume];
    
}

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKey = @"a1fc2c19d548237a56e0edd7b79b3ebc";

@end
