//
//  LMSForecastController.m
//  WeatherObjC
//
//  Created by Lisa Sampson on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "LMSForecastController.h"
#import "LMSForecast.h"

@interface LMSForecastController ()

@property (nonatomic) NSMutableArray *forecastArray;

@end

@implementation LMSForecastController

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKey = @"1725a509d2bc80d96d7ef7d415a25216";

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        _forecastArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchForecastForZipcode:(NSString *)zipcode withCompletion:(CompletionHandler)completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *zipCodeQuery = [[NSURLQueryItem alloc] initWithName:@"zip" value: zipcode];
    NSURLQueryItem *appIDQuery = [[NSURLQueryItem alloc] initWithName:@"appid" value:apiKey];
    NSURLQueryItem *unitsQuery = [[NSURLQueryItem alloc] initWithName:@"units" value:@"imperial"];
    
    components.queryItems = @[zipCodeQuery, appIDQuery, unitsQuery];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: components.URL];
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching forecasts for %@: %@.", zipcode, error);
            completion(error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data found by data task");
            completion([[NSError alloc] init]);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        NSString *city = dictionary[@"city"] [@"name"];
        NSArray *list = dictionary[@"list"];
        
        for (int i = 0; i < list.count; i++) {
            
            NSDictionary *forecastDictionary = list[i];
            
            LMSForecast *forecast = [[LMSForecast alloc] initWithName:city andDictionary:forecastDictionary];
            
            [forecasts addObject:forecast];
        }
        
        self.forecastArray = forecasts;
        completion(nil);
    }];
    
    [dataTask resume];
    
}

@end
