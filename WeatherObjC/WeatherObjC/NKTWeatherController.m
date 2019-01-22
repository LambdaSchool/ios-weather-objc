//
//  NKTWeatherController.m
//  WeatherObjC
//
//  Created by Nikita Thomas on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "NKTWeatherController.h"
#import "NKTWeather.h"

@implementation NKTWeatherController

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKeyString = @"84c0de52c4825b52cf12f5f89eb0fd88";

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _forecasts = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)searchForWeatherForZipCode:(int)zipCode completion:(void (^)(NSError *))completion
{
    NSString *zipCodeString = [NSString stringWithFormat:@"%d", zipCode];
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipCodeString];
    
    NSURLQueryItem *api = [[NSURLQueryItem alloc] initWithName:@"appid" value:@"imperial"];
    
    NSURLQueryItem *units = [[NSURLQueryItem alloc] initWithName:@"units" value:@"imperial"];
    
    components.queryItems = @[searchItem, api, units];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:components.URL];
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Error fetching weather");
            completion(error);
        }
        
        if (!data) {
            NSLog(@"No data returned from data task");
            completion([[NSError alloc] init]);
        }
        
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if ([dictionary isKindOfClass:[NSDictionary class]]) {
            NSMutableArray *forecasts = [NSMutableArray array];
            
            NSDictionary *cityDictionary = dictionary[@"city"];
            NSString *cityName = cityDictionary[@"name"];
            
            NSArray *resultsArray = dictionary[@"list"];
            
            for (NSDictionary *result in resultsArray) {
                
                NKTWeather *forecast = [[NKTWeather alloc] initWithDictionary:result city:cityName];
                
                [forecasts addObject:forecast];
            }
            
            completion(nil);
        }
    }];
    [dataTask resume];
}








@end
