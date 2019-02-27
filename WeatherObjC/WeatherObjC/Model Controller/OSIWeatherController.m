//
//  OSIWeatherController.m
//  WeatherObjC
//
//  Created by Sergey Osipyan on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "OSIWeatherController.h"
#import "OSIWeather.h"




@implementation OSIWeatherController

static NSString * const baseURL = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKey = @"a25d9515f2882a003bf4a6ffb6c32baf";

    - (instancetype)init
    {
        self = [super init];
        if (self) {
            _weatherForWeek = @[];
           
        }
        return self;
}

- (void)searchWeatherUsingZipCode:(NSString *)zipCode withBlock:(CompBlock)block {
    
    NSURL *URL = [NSURL URLWithString:baseURL];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL: URL resolvingAgainstBaseURL: YES];
    NSURLQueryItem *queryItemZipCode = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *queryItemApiKey = [NSURLQueryItem queryItemWithName:@"appid" value:apiKey];
    
    [urlComponents setQueryItems:@[queryItemZipCode, queryItemApiKey]];
    
    NSURL *searchURL = [urlComponents URL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL: searchURL];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
          
          if (error) {
              NSLog(@"Error fetching weather data: %@", error);
              block(nil, error);
              return;
          }
          if (!data) {
              NSLog(@"Data is missing");
              block(nil, [[NSError alloc] init]);
              return;
          }
          
          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
          if (![dict isKindOfClass:[NSDictionary class]]) {
              NSLog(@"JSON error");
              block(nil,error);
          
              return;
          }
          NSString *name = dict[@"city"][@"name"];
         // NSString *name = city[@"name"];
          
          NSArray *list = dict[@"list"];
          NSMutableArray *weatherForWeek = [[NSMutableArray alloc] init];
          
          //NSLog(name, list);
          
          for (NSDictionary *weatherDict in list) {
              
              
              OSIWeather *weather = [[OSIWeather alloc] initWithDictionary: weatherDict name:name];
                [weatherForWeek addObject: weather];
          }
          
          self.weatherForWeek = weatherForWeek;
          
          //NSLog(self.weatherForWeek);
          
          block(nil, nil);
      }] resume];
    
    
}

@end
