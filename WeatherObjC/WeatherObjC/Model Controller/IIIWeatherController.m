//
//  IIIWeatherController.m
//  WeatherObjC
//
//  Created by Marlon Raskin on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherController.h"
#import "IIIForecast.h"

@implementation IIIWeatherController

static NSString * const baseURLStr = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString * const apiKey = @"ada5cb97a548d821e707999a460d3d08";

- (void)searchWeatherWithZipcode:(NSString *)zipcode completion:(void (^)(NSString *cityName, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLStr];

    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];

    NSURLQueryItem *zipCodeQuery = [NSURLQueryItem queryItemWithName:@"zip" value:zipcode];
    NSURLQueryItem *measureSystemQuery = [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"];
    NSURLQueryItem *apiKeyQuery = [NSURLQueryItem queryItemWithName:@"appid" value:apiKey];

    [urlComponents setQueryItems:@[zipCodeQuery, measureSystemQuery, apiKeyQuery]];

    NSURL *requestURL = urlComponents.URL;

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        if (error) {
            NSLog(@"error fetching data: %@", error);
            completion(nil, error);
            return;
        }

        if (data == nil) {
            NSLog(@"No data was returned from data task");
            completion(nil, [[NSError alloc] init]);
            return;
        }

        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        if (![jsonDict isKindOfClass:[NSDictionary class]]) {
            NSLog(@"json is not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }

        NSArray *weatherInfo = jsonDict[@"list"];
        NSString *cityName = jsonDict[@"city"][@"name"];

        NSMutableArray *forecasts = [[NSMutableArray alloc] init];

        for (NSDictionary *forecastResult in weatherInfo) {
            IIIForecast *forecastResults = [[IIIForecast alloc] initWithDictionary:forecastResult name:cityName];

            [forecasts addObject:forecastResults];
        }
        self.forecasts = forecasts;
        completion(cityName, nil);
    }];
    [dataTask resume];
}

-(instancetype)init
{
    self = [super init];

    if (self != nil) {

        _forecasts = [[NSArray alloc] init];
    }
    return self;
}

@end
