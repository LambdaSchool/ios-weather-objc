//
//  JBForecastController.m
//  WeatherObjC
//
//  Created by Jon Bash on 2020-01-21.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "JBForecastController.h"

@implementation JBForecastController

static NSString *baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString *baseIconURLString = @"https://openweathermap.org/img/wn/";
static NSString *appID = @"88cbbc399e8121892ebc5e196a66400c";

-(instancetype)init {
    self = [super init];
    if (self) {
        _forecasts = @[];
    }
    return self;
}

-(void)fetchForecastsForZipCode:(NSString *)zipCode
                     completion:(void (^)(NSArray *forecasts, NSError *error))completion {
    NSURLComponents *components = [NSURLComponents componentsWithURL:[NSURL URLWithString:baseURLString]
                                             resolvingAgainstBaseURL:YES];
    NSURLQueryItem *zipItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"APPID" value:appID];
    NSURLQueryItem *unitsItem = [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"];
    components.queryItems = @[zipItem, apiKeyItem, unitsItem];
    NSURLRequest *request = [NSURLRequest requestWithURL:components.URL];
    [[NSURLSession.sharedSession dataTaskWithRequest:request
                                   completionHandler:^(NSData * _Nullable data,
                                                       NSURLResponse * _Nullable response,
                                                       NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }

        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&jsonError];
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }

        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary as expected");
            completion(nil, [[NSError alloc] init]); // TODO: error details
            return;
        }

        NSArray *forecastDictArray = dictionary[@"list"];
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        NSDictionary *cityDict = dictionary[@"city"];
        NSString *cityName = cityDict[@"name"];
        for (NSDictionary *forecastDict in forecastDictArray) {
            [forecasts addObject:[[JBForecast alloc] initWithDictionary:forecastDict
                                                               cityName:cityName]];
        }
        
        self.forecasts = forecasts;
        completion(forecasts, nil);
    }] resume];
}

-(void)fetchIconImageForCode:(NSString *)iconCode
                  completion:(void (^)(UIImage *image, NSError *error))completion {
    NSString *iconFileString = [NSString stringWithFormat:@"%@@2x.png", iconCode];
    NSURL *url = [[NSURL URLWithString:baseIconURLString] URLByAppendingPathComponent:iconFileString];

    [[NSURLSession.sharedSession dataTaskWithURL:url
                               completionHandler:^(NSData * _Nullable data,
                                                   NSURLResponse * _Nullable response,
                                                   NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }

        UIImage *image = [[UIImage alloc] initWithData:data];
        completion(image, nil);
    }] resume];
}

@end
