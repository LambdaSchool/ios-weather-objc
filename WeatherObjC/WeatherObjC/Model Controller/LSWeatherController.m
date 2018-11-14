//
//  LSWeatherController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSWeatherController.h"
#import "LSWeather.h"

@implementation LSWeatherController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [[NSArray alloc] init];
    }
    return self;
}

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKEYString = @"f051c0fa4e08fb98e909ba16e99e3882";

- (void)searchWeatherWithZip:(NSString *)searchTerm completion: (void (^)(NSArray *forecasts, NSError *error))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    
    NSURLQueryItem *zip = [[NSURLQueryItem alloc] initWithName:@"zip" value:searchTerm];
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:@"appid" value:apiKEYString];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:YES];
    [components setQueryItems:@[zip, apiKey]];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:components.URL];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error searching for zip code %@", error);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data returned");
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON is not a dictionary");
            completion(nil, error);
            return;
        }
        
        NSDictionary *city = dictionary[@"city"];
        NSString *name = city[@"name"];
        
        NSArray *list = dictionary[@"list"];
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *forecastDict in list) {
            LSWeather *forecast = [[LSWeather alloc] initWithDictionary:forecastDict name:name];
            [forecasts addObject:forecast];
        }
        
        self.forecasts = forecasts;
        completion(forecasts, nil);
        
    }] resume];
}

@end
