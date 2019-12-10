//
//  JLRDailyForecastController.m
//  WeatherObjC
//
//  Created by Jesse Ruiz on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLRDailyForecastController.h"
#import "JLRDailyForecast.h"

@implementation JLRDailyForecastController

static NSString *const baseURLString = @"api.openweathermap.org/data/2.5/forecast";
static NSString *const apiKeyString = @"d3a242c1515b867f921c2d3835f66fd1";

- (void)searchForForecastWithZipCode:(NSString *)zipCode
completion:(void (^)(NSArray *forecasts, NSError *error))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *zipItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *apiKey = [NSURLQueryItem queryItemWithName:@"api_key" value:apiKeyString];
    [components setQueryItems:@[zipItem, apiKey]];
    
    NSURL *url = [components URL];
    NSLog(@"URL: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionTask *task = [NSURLSession.sharedSession
                              dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        NSLog(@"Search results");
        
        if (error)
        {
            completion(nil, error);
            return;
        }
        
        if (data == nil)
        {
            NSLog(@"Data was nil");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization
                              JSONObjectWithData:data options:0 error:&jsonError];
        if(jsonError)
        {
            completion(nil, error);
            return;
        }
        
        if(![json isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"JSON was not a top level dictionary as expected");
            completion(nil, [[NSError alloc] init]);
        }
        
        NSArray *list = json[@"list"];
        NSMutableArray *forecast = [[NSMutableArray alloc] init];
        NSDictionary *city = json[@"city"];
        
        for (NSDictionary *dictionary in list)
        {
            JLRDailyForecast *forecasts = [[JLRDailyForecast alloc] initWithDictionary:dictionary cityName:city];
            [forecast addObject:forecasts];
        }
        completion(forecast, nil);
    }];
    [task resume];
}

@end
