//
//  JACWeatherController.m
//  WeatherObjC
//
//  Created by Jordan Christensen on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JACWeatherController.h"

@implementation JACWeatherController
NSString *apiKey = @"0c3aeb33f53ff5b801fbd6e3c0795414";
NSString *baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";

- (void)fetchWeatherByZip:(NSNumber *)zipCode
               completion:(void (^)(JACWeather *weather, NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *zipItem = [NSURLQueryItem queryItemWithName:@"zip" value:[NSString stringWithFormat:@"%@,us", zipCode]];
    NSURLQueryItem *keyItem = [NSURLQueryItem queryItemWithName:@"APPID" value:apiKey];
    [components setQueryItems:@[zipItem, keyItem]];
    NSURL *url = [components URL];
    NSLog(@"URL: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Weather results");
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Data was nil");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Json was not a top level dictionary as expected");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        JACWeather *weather = [[JACWeather alloc] initWithDictionary:json];
        
        completion(weather, nil);
    }];
    [task resume];
}

@end
