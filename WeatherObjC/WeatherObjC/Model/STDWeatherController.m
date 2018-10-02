//
//  STDWeatherController.m
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "STDWeatherController.h"
#import "STDWeather.h"

@interface STDWeatherController ()

@property NSMutableArray *internalArray;

@end

@implementation STDWeatherController

- (instancetype)initWithArray:(NSMutableArray *)array
{
    self = [super init];
    if (self) {
        _internalArray = array;
    }
    return self;
}

- (void)getWeatherDataForZipCode:(NSString *)zipCode completion:(void (^)(NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *zipQueryItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *appIdQueryItem = [NSURLQueryItem queryItemWithName:@"appid" value:apiKey];
    [components setQueryItems:@[zipQueryItem, appIdQueryItem]];
    NSURL *url = [components URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching weather data: %@", error);
            completion(error);
            return;
        }
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        if (![dict isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completion([[NSError alloc] init]);
            return;
        }
        
        NSString *city = dict[@"city"][@"name"];
        NSArray *forecasts = dict[@"list"];
        for (NSDictionary *forecast in forecasts) {
            STDWeather *weatherForecast = [[STDWeather alloc] initWithDict:forecast city:city];
            [self->_internalArray addObject:weatherForecast];
        }
        
        completion(nil);
        
    }] resume];
    
}

static NSString * const apiKey = @"394594a0d18fdce87655ab070146a70d";
static NSString * const baseURLString = @"https://samples.openweathermap.org/data/2.5/forecast/daily";

@end
