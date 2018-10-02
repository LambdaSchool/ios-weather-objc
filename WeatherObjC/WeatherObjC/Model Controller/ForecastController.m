//
//  ForecastController.m
//  WeatherObjC
//
//  Created by Linh Bouniol on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "ForecastController.h"
#import "Forecast.h"

@implementation ForecastController

static NSString * const bastURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKeyString = @"0f71747cf580477afbb3af0f07b51f28";

- (instancetype)init
{
    if (self = [super init]) {
        _forecasts = @[]; // empty array
    }
    return self;
}

- (void)loadForecastsForZipcode:(NSString *)zipcode completion:(void (^)(NSArray *forecasts, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:bastURLString];
    
    // need when have a search term
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    // zip is what the api calls it
    NSURLQueryItem *zip = [NSURLQueryItem queryItemWithName:@"zip" value:zipcode];
    
    // pretty much like registering your app
    NSURLQueryItem *appID = [NSURLQueryItem queryItemWithName:@"APPID" value:apiKeyString];
    
    [components setQueryItems:@[zip, appID]];
    
    NSURL *url = [components URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error fetching data: %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
            return;
        }
        
        // if no data,...
        if (!data) {
            NSLog(@"Data is missing");
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, [[NSError alloc] init]);
            });
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        // make sure what you got back is actually a dictionary
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, [[NSError alloc] init]);
            });
            return;
        }
        
        // extract city name
        NSDictionary *city = dictionary[@"city"]; // in a real app, should make sure that city is a dictionary as well
        NSString *name = city[@"name"]; // here make sure name is a string (swift does all of the check for you)
        
        // "list" belongs to the main dictionary
        NSArray *list = dictionary[@"list"];
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        
        // loop through the list of dictionaries
        for (NSDictionary *forecastDictionary in list) {
            // for each dictionary, pass it into the initWithDicitonary initializer, we wrote in the model, so the model can create itself with the info it can extract from the dictionary
            
            Forecast *forecast = [[Forecast alloc] initWithDictionary:forecastDictionary name:name];
            [forecasts addObject:forecast];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // self is a struct, not the same as the struct in swift. _forecasts is a property on the struct in ObjC, to access it you need to use -> ( this is need when the property is read only) self->_forecasts = ...
            // since the property is not read only, you can use . syntax
            
            self.forecasts = forecasts;
            completion(forecasts, nil);
        });
    }] resume];
    
}

@end
