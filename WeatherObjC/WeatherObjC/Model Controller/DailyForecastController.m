//
//  DailyForecastController.m
//  WeatherObjC
//
//  Created by Ivan Caldwell on 3/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "DailyForecastController.h"
#import "DailyForecast.h"

static NSString *baseURLString =  @"https://samples.openweathermap.org/data/2.5/forecast/daily";
static NSString *apiKeyString = @"a542f2a7d7c21ad41d25a57783fe84d8";

@implementation DailyForecastController

- (void)fetchForecastForZipcode:(NSString *)zipcode completionBlock:(CompletionHandler)completionBlock {

    // creating our url
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    NSMutableArray *queryItems = [@[[NSURLQueryItem queryItemWithName:@"zip" value: zipcode],
                                    [NSURLQueryItem queryItemWithName:@"appid" value: apiKeyString]
                                    ] mutableCopy];
    [urlComponents setQueryItems:queryItems];
    NSURL *url = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching forecast: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!dictionary) {
            NSLog(@"Error decoding json: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        // Create the collections for the information expected to receive
        NSDictionary *city = dictionary[@"city"];
        NSString *name = city[@"name"];
        
        NSArray *list = dictionary[@"list"];
        // Forgot why this needs to be mutable... TODO... figure out...
        NSMutableArray *dailyForecasts = [[NSMutableArray alloc] init];
        
        
        // I think I saw a map function for this using lambdas? Asks about it...
        for (NSDictionary *dictionary in list) {
            DailyForecast *dailyForecast = [[DailyForecast alloc] initWithDictionary:dictionary city:name];
            [dailyForecasts addObject:dailyForecast];
        }
        completionBlock(dailyForecasts, nil);
        
    }] resume];
}
@end
