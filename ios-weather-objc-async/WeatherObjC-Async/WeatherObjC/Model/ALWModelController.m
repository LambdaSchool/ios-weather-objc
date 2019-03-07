//
//  ALWModelController.m
//  WeatherObjC
//
//  Created by Audrey Welch on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "ALWModelController.h"
#import "ALWForecast.h"

@interface ALWModelController ()

@property NSString *baseURLString;
@property NSString *apiKey;

@end

@implementation ALWModelController

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _forecasts = [NSArray arrayWithObjects: nil];
        //_forecasts = @[];
        _baseURLString = @"https://api.openweathermap.org/data/2.5/weather";
        //_baseURLString = @"https://samples.openweathermap.org/data/2.5/weather";
        _apiKey = @"b183d7ec4c0c9dcc5178324816716c88";
    }
    return self;
}

- (void)searchForForecastWithZipCode:(NSString *)zipCode completion:(void (^)(NSArray* forecasts, NSError *))completion {
    
    
    // Create a URL
    NSURL *baseURL = [NSURL URLWithString:_baseURLString];
    
    // Turn it into components
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    // Set query items
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *fahrenheitItem = [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"appid" value:_apiKey];
    
    [components setQueryItems:@[searchItem, fahrenheitItem, apiKeyItem]];
    
    // Get URL from components
    NSURL *url = [components URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // Create a data task
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler: ^(NSData *data, NSURLResponse *r, NSError *error) {
        if (error != nil) {
            NSLog(@"Error fetching data %@", error);
            completion(nil, error);
            return;
        }
        
        // top level is dictionary
        // weather: []
        // name
        
        // Take data and turn it into a JSON object (a dictionary)
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        // Check to make sure it's a dictionary and not an array
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completion(nil, error);
            return;
        }
        
        // If it is a dictionary, we need to first pull out the name
        ALWForecast *forecast = [[ALWForecast alloc] init];
        forecast.name = [dictionary objectForKey:@"name"];
        
        // and then indicate that our model is one level deep (inside "weather")
        // Get out the "weather" key
        NSArray *weatherResults = [dictionary objectForKey:@"weather"];
        // Make sure it is an array
        if ([weatherResults isKindOfClass:[NSArray class]] == NO) {
            NSLog(@"JSON does not have weather array");
            completion(nil, nil);
            return;
        }
        
        // Inside is a dictionary
        NSDictionary *firstResult = [weatherResults firstObject];
        if ([firstResult isKindOfClass:[NSDictionary class]] == NO) {
            completion(nil, nil);
            return;
        }
        
        forecast.icon = [firstResult objectForKey:@"icon"];
        
        // Get out the "main" key
        NSDictionary *mainResults = [dictionary objectForKey:@"main"];
        // Make sure it is a dictionary
        if ([mainResults isKindOfClass:[NSDictionary class]] == NO) {
            NSLog(@"JSON does not have a 'main' dictionary");
            completion(nil, nil);
            return;
        }
        
        forecast.temp = [mainResults objectForKey:@"temp"];
        
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        
        //_forecasts = forecasts;
        
        completion(forecasts, nil);
        
        NSLog(@"%@", forecast);
        
        [forecasts addObject: forecast];
        NSLog(@"%@", forecasts);
        
        self.forecasts = forecasts;
        
    }] resume] ;
    
}

@end
