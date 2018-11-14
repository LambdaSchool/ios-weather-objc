//
//  MUForecastController.m
//  WeatherObjC
//
//  Created by Moin Uddin on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "MUForecastController.h"
#import "../Models/MUForecast.h"
@implementation MUForecastController

- (instancetype)initWithForecasts:(NSMutableArray *)forecasts
{
    self = [super init];
    if (self) {
        _forecasts = [NSMutableArray alloc];
    }
    return self;
}

- (void)searchForWeatherWithCity:(NSString *)cityName completion:(void (^)(NSArray *, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *cityQueryItem = [[NSURLQueryItem alloc] initWithName:@"q" value:cityName];
    NSURLQueryItem *metricQueryItem = [[NSURLQueryItem alloc] initWithName:@"units" value:@"metric"];
    NSURLQueryItem *cntQueryItem  = [[NSURLQueryItem alloc] initWithName:@"cnt" value:@"7"];
    NSURLQueryItem *appidQueryItem  = [[NSURLQueryItem alloc] initWithName:@"appid" value:apiKey];
    
    [components setQueryItems: @[cityQueryItem, metricQueryItem , cntQueryItem , appidQueryItem]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:components.URL];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error searching for person: %@", error);
            completion(nil, error);
            return;
        }
        
        if(!data) {
            NSLog(@"No data returned from data task");
            completion(nil, [[NSError alloc] init]);
        }
        
        NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if (![dictionary isKindOfClass: [NSDictionary class]]) {
            NSLog(@"JSON is not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSString *city = dictionary[@"city"][@"name"];
        NSArray *forecastDictionaries = dictionary[@"list"];
        
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *forecastDictionary in forecastDictionaries) {
            MUForecast *forecast = [[MUForecast alloc] initWithCity:city dictionary:forecastDictionary];
            [forecasts addObject:forecast];
        }
        completion(forecasts, nil);
        
    }] resume];
}


static NSString * const baseURLString = @"api.openweathermap.org/data/2.5/forecast";
static NSString * const apiKey = @"f144c855a01a9bd80c692dd246ed42e9";
static NSString *const URL = @"https://api.openweathermap.org/data/2.5/forecast?q=boston,us&cnt=7&appid=f144c855a01a9bd80c692dd246ed42e9";
@end
