//
//  HHWeatherController.m
//  WeatherObjC
//
//  Created by Hayden Hastings on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "HHWeatherController.h"
#import "HHWeather.h"

@implementation HHWeatherController

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString * const apiKey = @"14cb40aeaa54152e2db5015c9830c260";

- (void)fetchWeatherForCity:(NSString *)cityName completionBlock:(HHWeatherControllerCompletionBlock)completionBlock {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *city = [NSURLQueryItem queryItemWithName:@"q" value:cityName];
    NSURLQueryItem *metric = [NSURLQueryItem queryItemWithName:@"units" value:@"metric"];
    NSURLQueryItem *cnt = [NSURLQueryItem queryItemWithName:@"cnt" value:@"7"];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"appid" value:apiKey];
    
    [components setQueryItems:@[city, metric, cnt, apiKeyItem]];
    
    NSURL *requestURL = components.URL;
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (error) {
            NSLog(@"Error fetching data: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        if (data) {
            NSLog(@"No data returned.");
            completionBlock(nil, [[NSError alloc] init]);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if (![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Json wsa not a dictionary");
            completionBlock(nil, [[NSError alloc] init]);
            return;
        }
        
        NSString *nameCity = jsonDictionary[@"city"][@"name"];
        NSArray *forecastDictionary = jsonDictionary[@"list"];
        
        NSMutableArray *localWeather = [[NSMutableArray alloc] init];
        
        for (NSDictionary *forecastDict in forecastDictionary) {
            HHWeather *weather = [[HHWeather alloc] initWithCityName:nameCity dictionary:forecastDict];
            
            [localWeather addObject:weather];
        }
        completionBlock(localWeather, nil);
    }];
    [dataTask resume];
}
@end
