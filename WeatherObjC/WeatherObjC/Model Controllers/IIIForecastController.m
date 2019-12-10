//
//  IIIForecastController.m
//  WeatherObjC
//
//  Created by Gi Pyo Kim on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecastController.h"
#import "IIIForecast.h"

@implementation IIIForecastController

static NSString *const baseURLString = @"api.openweathermap.org/data/2.5/forecast";
static NSString *const defaultApiKey = @"7f0a6369a06918fc7010f1239b0e0d43";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)searchCityWithZipCode:(NSString *)zipCode
                   completion:(void (^)(NSArray *Forecasts, NSError *error))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *searchZipCode = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *apiKey = [NSURLQueryItem queryItemWithName:@"APPID" value:defaultApiKey];
    [components setQueryItems:@[searchZipCode, apiKey]];
     
    NSURL *url = [components URL];
    NSLog(@"URL: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Data returned nil");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if(jsonError) {
            completion(nil, error);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a top level dictionary as expected");
            completion(nil, [[NSError alloc] init]);
            return;
        }

        NSArray *results = json[@"list"];
        NSDictionary *cityContainer = json[@"city"];
        NSString *cityName = cityContainer[@"name"];
                
        for (NSDictionary *dictionary in results) {
            IIIForecast *forecast = [[IIIForecast alloc] initwithDictionary:dictionary cityName:cityName];
            [self.forecasts addObject:forecast];
        }
        completion(self.forecasts, nil);

    }];
    [task resume];
     
}

@end
