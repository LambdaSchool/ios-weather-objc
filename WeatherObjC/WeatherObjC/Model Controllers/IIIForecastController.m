//
//  IIIForecastController.m
//  WeatherObjC
//
//  Created by morse on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "IIIForecastController.h"
#import "IIIForecast.h"

@implementation IIIForecastController

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString * const apiKey = @"ab49e25ab8abbb888f4f067b2ab61bb6";


- (void)searchForForecastsWithZipCode:(NSString *)zipCode
                           completion:(void (^)(NSArray *forcasts, NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSString *fullTerm = [NSString stringWithFormat:@"%@,us", zipCode];
    
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"zip" value:fullTerm];
    NSURLQueryItem *appID = [NSURLQueryItem queryItemWithName:@"APPID" value:apiKey];
    [components setQueryItems:@[searchItem, appID]];
    NSURL *url = components.URL;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    
    NSLog(@"URL: %@", url);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"DATA: %@", data);
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a Dictionary as expected");
            completion(nil, [[NSError alloc] init]); // TODO: populate error details
            return;
        }
        
//        NSLog(@"*****JSON: %@", dictionary);
        
        NSString *city = dictionary[@"city"][@"name"];
        
        self.forecasts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *forecastDictionary in dictionary[@"list"]) {
            
            NSObject *temperature = forecastDictionary[@"main"][@"temp"];
            NSString *tempString = [NSString stringWithFormat:@"%@", temperature];
            double tempDouble = [tempString doubleValue];
            double fahrenheit = (tempDouble -273.15) * 1.8 + 32;
            NSString *fahrenheitString = [NSString stringWithFormat:@"%f", fahrenheit];
            NSLog(@"%0.0f, %@", fahrenheit, fahrenheitString);
            /*
             alternative:
             NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
             f.numberStyle = NSNumberFormatterDecimalStyle;
             NSNumber *myNumber = [f numberFromString:@"42"];
             
             I'd like to know how this "should" look though.
             */
            
            NSString *image = forecastDictionary[@"weather"][0][@"icon"];
            NSLog(@"%@", image);
            
            IIIForecast *forecast = [[IIIForecast alloc] initWithCity:city temp:fahrenheitString icon:image];
            
            
            
            [self.forecasts addObject:forecast];
            
            
            
        }
//        NSLog(@"Count: %lu", (unsigned long)self.forecasts[3]);
        completion(self.forecasts, nil);
        
        
        
    }] resume];
    
}


@end
