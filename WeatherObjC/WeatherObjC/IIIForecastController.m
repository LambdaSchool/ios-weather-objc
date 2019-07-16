//
//  IIIForecastController.m
//  WeatherObjC
//
//  Created by Thomas Cacciatore on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecastController.h"

@implementation IIIForecastController

static NSString *baseURLString = @"api.openweathermap.org/data/2.5/weather?";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchForcastWithCityName:(NSString *)cityName completionBlock:(IIIForcastFetcherCompletionBlock)completionBlock {
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    NSArray *queryItems = @[
                            [NSURLQueryItem queryItemWithName:@"city name" value:cityName],
                            [NSURLQueryItem queryItemWithName:@"appid" value:@"a3c0e150f58875d0e5385a9984741de2"],
                            
                            ];
    urlComponents.queryItems = queryItems;
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching forecast: %@", error);
            completionBlock(nil, error);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        NSObject *forecast = json[@"city"];
        [self->_forecasts addObject:forecast];
        completionBlock(forecast, nil);
    }];
    [task resume];
    
}





@end
