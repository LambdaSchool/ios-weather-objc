//
//  WeatherController.m
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "WeatherController.h"
#import "Weather.h"

@interface WeatherController ()

@property (nonatomic, copy) NSMutableArray *internalForecasts;

@end

@implementation WeatherController

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKeyString = @"1340d66bb372ff93adebd79d41eea048";

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _internalForecasts = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)forecasts
{
    return self.internalForecasts;
}

-(void)searchForWeatherWithZipCode:(int)zipCode completion:(void (^)(NSError *))completion
{
    NSString *zipCodeString = [NSString stringWithFormat:@"%d", zipCode];
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *searchItem = [[NSURLQueryItem alloc] initWithName:@"zip" value: zipCodeString];
    NSURLQueryItem *api = [[NSURLQueryItem alloc] initWithName:@"appid" value:apiKeyString];
    NSURLQueryItem *units = [[NSURLQueryItem alloc] initWithName:@"units" value:@"imperial"];
    [components setQueryItems: @[searchItem, api, units]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: components.URL];
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error fetching forecasts at %d: %@.", zipCode, error);
            completion(error);
            return;
        }
        
        if (!data)
        {
            NSLog(@"No data returned from data task");
            completion([[NSError alloc] init]);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Error deserializing JSON: %@", error);
            completion(error);
            return;
        }
        
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        
        NSDictionary *cityDictionary = dictionary[@"city"];
        NSString *cityName = cityDictionary[@"name"];
        
        NSArray *listDictionaries = dictionary[@"list"];
        
        for (int i = 0; i < listDictionaries.count; i++)
        {
            
            NSDictionary *forecastDictionary = listDictionaries[i];
            
            Weather *forecast = [[Weather alloc] initWithDictionary:forecastDictionary city:cityName];
            
            [forecasts addObject:forecast];
        }
        
        self.internalForecasts = forecasts;
        completion(nil);
        
    }];
    [dataTask resume];
     
     
}

@end
