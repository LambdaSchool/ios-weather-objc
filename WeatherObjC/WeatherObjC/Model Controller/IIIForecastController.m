//
//  IIIForecastController.m
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_95 on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecastController.h"
#import "IIIForecast.h"

static NSString *baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString *apiKeyString = @"1340d66bb372ff93adebd79d41eea048";

@interface IIIForecastController ()

@property (nonatomic, copy) NSMutableArray *internalForecasts;

@end

@implementation IIIForecastController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalForecasts = [[NSMutableArray alloc]init];
    }
    return self;
}

/*- (void)fetchForecastAtZipcode:(int)zipcode completionBlock:(IIIForecastFetcherCompletionBlock)completionBlock {*/

- (void)fetchForecastsForZipCode:(int)zipcode completion:(void (^)(NSError *))completion;
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    NSString *zipcodeString = [NSString stringWithFormat:@"%d", zipcode];
    
    // Query parameters
    
    NSMutableArray *queryItems = [@[[NSURLQueryItem queryItemWithName:@"zip" value:zipcodeString], [NSURLQueryItem queryItemWithName:@"appid" value:apiKeyString], [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"]
                                    ] mutableCopy];
    
    // Zipcode parameters
    
    urlComponents.queryItems = queryItems;
    
    // URL
    NSURL *url = urlComponents.URL;
    
    //DataTask
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // Error
        if (error) {
            NSLog(@"Error fetching forecasts: %@", error);
            completion(error);
            return;
        }
       
        // Parse
        NSError *jsonError;
        NSDictionary *dictionary =
        [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!dictionary) {
            NSLog(@"Error decoding: %@", error);
            completion(error);
            return;
        }
        
        NSArray *forecastDictionaries = dictionary[@"list"];
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        
        NSDictionary *cityDictionary = dictionary[@"city"];
        NSString *cityName = cityDictionary[@"name"];
        
         for (NSDictionary *dict in forecastDictionaries) {
         IIIForecast *forecast = [[IIIForecast alloc] initWithName:cityName dictionary:dict];
         
         [forecasts addObject:forecast];
         }
        
        self.internalForecasts = forecasts;
        NSLog(@"Forecasts: %@", forecasts);
        completion(nil);
    }];
    
    [task resume];
    
}

- (NSArray *)forecasts
{
    return self.internalForecasts;
}

@end
