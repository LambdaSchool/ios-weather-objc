//
//  VVSWeatherController.m
//  WeatherObjC
//
//  Created by Vici Shaweddy on 2/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "VVSWeatherController.h"
#import "VVSWeather.h"
#import "VVSTemp.h"

@interface VVSWeatherController ()

@property VVSWeather *currentWeather;

@end

@implementation VVSWeatherController

- (NSString *)urlForZipCode:(NSNumber *)zipCode
{
    NSString *unit = @"imperial";
    NSString *key = @"87efdf59a26815f2bc232a3fc783e7dd";

    return [NSString stringWithFormat:@"https://api.openweathermap.org/data/2.5/forecast?zip=%@,us&units=%@&appid=%@", zipCode, unit, key];
}

- (void)searchForCityWithZipCode:(NSNumber *)zipCode
                      completion:(void (^)(VVSWeather *weather, NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:[self urlForZipCode:zipCode]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:baseURL];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Search results");
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Data was nil");
            completion(nil, [[NSError alloc]init]);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if(jsonError) {
            completion(nil, error);
            return;
        }
        
        if(![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a top level dictionary as expected");
            completion(nil, [[NSError alloc]init]);
            return;
        }
    
        self.currentWeather = [[VVSWeather alloc] initWithDictionary:json];
        completion(self.currentWeather, nil);
    }];
    [task resume];
}

@end
