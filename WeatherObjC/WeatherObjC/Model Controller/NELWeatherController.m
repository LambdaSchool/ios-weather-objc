//
//  NELWeatherController.m
//  WeatherObjC
//
//  Created by Nelson Gonzalez on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "NELWeatherController.h"
#import "NELWeather.h"

@implementation NELWeatherController

- (instancetype)initWithWeatherForecasts:(NSMutableArray *)forecasts
{
    self = [super init];
    if (self) {
        _forecasts = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)getWeatherForCity:(NSString *)cityName completion:(void (^)(NSArray *, NSError *))completion
{
    NSURL *baseUrl = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseUrl resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *cityQueryItem = [NSURLQueryItem queryItemWithName:@"q" value:cityName];
    
    NSURLQueryItem *metricQueryItem = [NSURLQueryItem queryItemWithName:@"units" value:@"metric"];
    
    NSURLQueryItem *cntQueryItem = [NSURLQueryItem queryItemWithName:@"cnt" value:@"7"];
    
    NSURLQueryItem *apiKeyQueryItem = [NSURLQueryItem queryItemWithName:@"appid" value:apiKey];
    
    [components setQueryItems:@[cityQueryItem, metricQueryItem, cntQueryItem, apiKeyQueryItem]];
    
    NSURL *requestUrl = components.URL;
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:requestUrl completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        if (error) {
            NSLog(@"Error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data returned from data task");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        //convert data to our model objects
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        //check to make sure that the dict is actually a dict
        if (![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            //if its not a dict.
            NSLog(@"Json was not dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        
        NSString *theCityName = jsonDictionary[@"city"][@"name"];
        NSArray *forecastDictionary = jsonDictionary[@"list"];
        
         NSMutableArray *localWeather = [[NSMutableArray alloc] init];
        
        for (NSDictionary *forecastDict in forecastDictionary) {
            NELWeather *weather = [[NELWeather alloc] intiWithCityName:theCityName dictionary:forecastDict];
            
            //equivalent of .append
            [localWeather addObject:weather]; //append
        }
        completion([self forecasts], nil);
        
    }];
    
    [dataTask resume];
}




static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString * const apiKey = @"5fb90a32c56d0428549831fd6dc0dd18";

@end

//Sample url structure
//https://api.openweathermap.org/data/2.5/forecast?q=miami,us&cnt=7&appid=5fb90a32c56d0428549831fd6dc0dd18
