//
//  IIIWeatherController.m
//  WeatherObjC
//
//  Created by John Kouris on 2/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "IIIWeatherController.h"
#import "IIIForecast.h"

@implementation IIIWeatherController

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString * const apiKey = @"785011b25198bdee56d8ea591a7ccf8b";

-(instancetype)init
{
    self = [super init];

    if (self != nil) {

        _forecasts = [[NSArray alloc] init];
    }
    return self;
}

- (void)getForecastAtZipcode:(NSString *)zipcode completion:(void (^)(NSString *cityName, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];

    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];

    NSURLQueryItem *zipCode = [NSURLQueryItem queryItemWithName:@"zip" value:zipcode];
    NSURLQueryItem *measurementType = [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"];
    NSURLQueryItem *apiKeyQuery = [NSURLQueryItem queryItemWithName:@"appid" value:apiKey];

    [urlComponents setQueryItems:@[zipCode, measurementType, apiKeyQuery]];

    NSURL *requestURL = urlComponents.URL;

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        if (error) {
            NSLog(@"error retrieving forecast data: %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (!results) {
            NSLog(@"Error decoding json: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, jsonError);
            });
            
            return;
        }

        NSArray *forecastInfoDictionaries = results[@"list"];
        NSString *cityName = results[@"city"][@"name"];

        NSMutableArray *forecasts = [[NSMutableArray alloc] init];

        for (NSDictionary *forecastResult in forecastInfoDictionaries) {
            IIIForecast *forecast = [[IIIForecast alloc] initWithDictionary:forecastResult name:cityName];
            [forecasts addObject:forecast];
        }
        
        self.forecasts = forecasts;
        completion(cityName, nil);
    }];
    [dataTask resume];
}

@end
