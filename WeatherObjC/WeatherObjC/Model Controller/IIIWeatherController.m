//
//  IIIWeatherController.m
//  WeatherObjC
//
//  Created by Christopher Aronson on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherController.h"
#import "IIIWeather.h"

@implementation IIIWeatherController

static NSString *baseURL = @"https://api.openweathermap.org/data/2.5/forecast"; //?zip=98597,us&weather&APPID=ec901f4afb2d7ea3052bd30d0f94d882

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _weatherList = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)fetchWeatherFromZip:(NSNumber *)zip withCompletion: (CompletionBlock)completion {
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    NSArray *queryItems = @[
                            [NSURLQueryItem queryItemWithName:@"zip" value:[zip stringValue]],
                            [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"],
                            [NSURLQueryItem queryItemWithName:@"APPID" value:@"ec901f4afb2d7ea3052bd30d0f94d882"]
                            ];
    
    components.queryItems = queryItems;
    
    NSURL *url = [components URL];
    
    NSURLSessionTask *fetchWeatherTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data,
                                                                                                               NSURLResponse * _Nullable response,
                                                                                                               NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Could not fetch weather data: %@", error);
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"Could not Convert data: %@", jsonError);
            completion(nil, jsonError);
            return;
        }
        
        IIIWeather *weather = [[IIIWeather alloc] initWithJsonDictionary:json];
        
        [[self weatherList] addObject:weather];
        
        completion(json, nil);
    }];
    
    [fetchWeatherTask resume];
    
}

@end
