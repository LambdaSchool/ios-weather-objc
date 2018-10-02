//
//  WeatherController.m
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "WeatherController.h"
#import "Weather.h"

@implementation WeatherController

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKeyString = @"ea518a0fc823cdf7dbdbd63b9e86469d";

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _forecasts = [[NSMutableArray alloc] init];
        _apiId = [[NSString alloc] init];
    }
    
    return self;
}

-(void)searchForWeatherWithZipCode:(NSString *)zipCode appID: (NSString *)apiId completion:(void (^)(NSArray *forcasts, NSError *))completion
{
    _apiId = apiKeyString;
    apiId = _apiId;
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL: baseURL resolvingAgainstBaseURL: YES];
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName: @"zip" value:zipCode];
    NSURLQueryItem *api = [NSURLQueryItem queryItemWithName:@"appid" value:apiId];
    [components setQueryItems: @[searchItem, api]];
    NSURL *url = [components URL];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error){
        if (error != nil)
        {
            NSLog(@"Error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data  options:0 error:NULL];
        if (![dictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"JSON was not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        
        NSArray *forecastDictionaries = dictionary[@"list"];
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in forecastDictionaries)
        {
            Weather *weather = [[Weather alloc] initWithDictionary:dictionary city:zipCode];
            [forecasts addObject: weather];
            
        }
        completion(forecasts, nil);
        NSLog(@"%@", forecasts);
    }] resume];
}

@end
