//
//  YZIWeatherController.m
//  WeatherObjC
//
//  Created by Yvette Zhukovsky on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "YZIWeatherController.h"
#import "YZIWeather.h"

@implementation YZIWeatherController

-(instancetype)init
{
    self = [super init] ;
    if(self) {
        _forecasts = [[NSArray alloc] init] ;
        
    }
    return self;
}

- (void)searchWithZip: (NSString *)searchTerm completion: (void (^)(NSArray *forecasts, NSError *error)) completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    
    NSURLQueryItem *zip = [[NSURLQueryItem alloc] initWithName:@"zip" value:searchTerm];
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:@"appid" value:apiKEYString];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:YES];
    [components setQueryItems:@[zip, apiKey]];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:components.URL];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse *  response, NSError * error) {
        
        if (error) {
            NSLog(@"Error searching for zip code %@", error);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data returned");
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON is not a dictionary");
            completion(nil, error);
            return;
        }
        
        NSDictionary *city = dictionary[@"city"];
        NSString *name = city[@"name"];
        
        NSArray *list = dictionary[@"list"];
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *forecastDict in list) {
            YZIWeather *forecast = [[YZIWeather alloc] initWithDictionary:forecastDict name:name];
            [forecasts addObject:forecast];
        }
        
        self.forecasts = forecasts;
        completion(forecasts, nil);
        
        
    }] resume];
     
     
     }
     static NSString * const baseURLString = @"https://samples.openweathermap.org/data/2.5/forecast/daily";
     static NSString * const apiKEYString = @"a603ca45a88a1f5bee550fd3407dd996";
     
     
     @end
