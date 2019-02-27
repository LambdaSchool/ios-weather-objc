//
//  DRMForcastController.m
//  WeatherObjC
//
//  Created by Dillon McElhinney on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "DRMForcastController.h"


@implementation DRMForcastController

static NSString * baseURL = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * apiKey = @"a25d9515f2882a003bf4a6ffb6c32baf";

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        [self setForecasts: @[]];
    }
    return self;
}

- (void)fetchForecastForZipcode: (NSString *)zipcode withCompletion: (CompletionHandler)completion {
    NSURLComponents *urlComponents = [NSURLComponents  componentsWithString: baseURL];
    NSURLQueryItem *zipcodeQuery = [NSURLQueryItem queryItemWithName:@"zip" value: zipcode];
    NSURLQueryItem *unitsQuery = [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"];
    NSURLQueryItem *countQuery = [NSURLQueryItem queryItemWithName:@"cnt" value:@"7"];
    NSURLQueryItem *appIDQuery = [NSURLQueryItem queryItemWithName:@"appid" value: apiKey];
    [urlComponents setQueryItems: @[zipcodeQuery, unitsQuery, countQuery, appIDQuery]];
    
    NSURL *requestURL = urlComponents.URL;
    
    NSURLSessionDataTask *datatask = [NSURLSession.sharedSession dataTaskWithURL: requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            completion(error);
            return;
        }
        
        if (data != nil) {
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData: data options: 0 error: NULL];
            NSString *city = results[@"city"][@"name"];
            NSArray *days = results[@"list"];
            
            NSMutableArray *newForecasts = [[NSMutableArray alloc] init];
            for (NSDictionary *day in days) {
                DRMDailyForecast *forecast = [[DRMDailyForecast alloc] initWithDictionary: day andCity:city];
                if (forecast) {
                    [newForecasts addObject: forecast];
                } else {
                    NSLog(@"Wasn't able to initialize a forecast from day: %@", day);
                }
            }
            [self setForecasts: newForecasts];
            completion(nil);
        } else {
            // TODO: figure out how to return an error in the case that no data is returned.
        }
        
    }];
    
    [datatask resume];
}

@end
