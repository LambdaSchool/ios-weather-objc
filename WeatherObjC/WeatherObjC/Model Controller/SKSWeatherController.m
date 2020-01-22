//
//  SKSWeatherController.m
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_204 on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "SKSWeatherController.h"
#import "SKSWeather.h"

@implementation SKSWeatherController

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString * const apiKey = @"0228a3b4023f7e3a6c1392772f677130";

//api.openweathermap.org/data/2.5/forecast?zip=94040&APPID=0228a3b4023f7e3a6c1392772f677130

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)searchForForecastsByZipCode:(NSString *)zipcode completion:(void (^)(NSError *error))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];

    NSURLQueryItem *zipItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipcode];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"APPID" value:apiKey];
    [components setQueryItems:@[zipItem, apiKeyItem]];

    NSURL *url = components.URL;

    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            completion(error);
            return;
        }


        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) {
            completion(jsonError);
            return;
        }

        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSError *dictionaryError = [[NSError alloc] init];
            // RESPONSE?
            completion(dictionaryError);
            return;
        }

        NSDictionary *cityDictionary = dictionary[@"city"];
        NSLog(@"City Dictionary: %@", cityDictionary);
        NSString *cityName = cityDictionary[@"name"];

        NSArray *forecastDictionaries = dictionary[@"list"];

        for (NSDictionary *forecastDictionary in forecastDictionaries) {
            SKSWeather *weather = [[SKSWeather alloc] initWithNameAndDictionary:cityName dictionary:forecastDictionary];
            [self.forecasts addObject:weather];
        }
        completion(nil);

    }] resume];

}

@end
