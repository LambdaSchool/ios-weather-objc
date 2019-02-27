//
//  ModelController.m
//  WeatherObjC
//
//  Created by Benjamin Hakes on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "ModelController.h"
#import "Forecast.h"

@interface ModelController()

@property NSString *baseURLString;
@property NSString *apiKey;
@property NSMutableArray *internalArray;

@end

@implementation ModelController

- (instancetype)initWithArray:(NSMutableArray *)array{
    self = [super init];
    if (self) {
        _forecasts = [[NSArray alloc] init];
        _baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
        _apiKey = @"f6ae4d490fc63a60a03cd46fc1250229";
        
    }
    return self;
}

-(void)searchForecastForZip: (NSString *)zipCode withBlock:(CompletionBlock)completion {

    NSURL *baseURL = [NSURL URLWithString:_baseURLString];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL: baseURL resolvingAgainstBaseURL: YES];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *queryItem2 = [NSURLQueryItem queryItemWithName:@"appid" value:_apiKey];
    NSArray<NSURLQueryItem *> *queryItems = @[queryItem, queryItem2];
    
    urlComponents.queryItems = queryItems;
    
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
              completion(nil, error);
              return;
          }
          
          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
          if (![dict isKindOfClass:[NSDictionary class]]) {
              NSLog(@"JSON was not a dictionary");
              completion(nil,error);
              return;
          }
          
          NSString *city = dict[@"city"][@"name"];
          NSArray *forecasts = dict[@"list"];

        
          self->_forecasts = self->_internalArray;
          
          completion(nil, nil);
      }] resume];
    
    
}

@end
