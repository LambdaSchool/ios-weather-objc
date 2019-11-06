//
//  JLCWeatherController.m
//  WeatherObjC
//
//  Created by Jake Connerly on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLCWeatherController.h"
#import "JLCOneDayForcast.h"

@implementation JLCWeatherController
static NSString *const baseURLString = @"https://api.openweathermap.org/data/2.5/find";

- (void)searchForWeatherByCity:(NSString *)cityName
                    completion:(void (^)(NSArray *forcasts, NSError *error))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *cityToSearch = [NSURLQueryItem queryItemWithName:@"q" value:cityName];
    NSURLQueryItem *units = [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"];
    NSURLQueryItem *appID = [NSURLQueryItem queryItemWithName:@"appid" value:@"239cafdec8e45203f03203dad58b13aa"];
    [components setQueryItems:@[cityToSearch, units, appID]];
    
    NSURL *url = [components URL];
    NSLog(@"url: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Search Results");
        
    // Check for error, call completion
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if(jsonError) {
            completion(nil, error);
            return;
        }
        
        // Check for data, parse it
        if(![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a top level dictionary as expected");
            completion(nil, [[NSError alloc] init]);
        }
        
        
        NSArray *list = json[@"list"];
        NSMutableArray *forcasts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dictionary in list) {
            JLCOneDayForcast *forcast = [[JLCOneDayForcast alloc] initWithDictionary:dictionary];
            [forcasts addObject:forcast];
        }
        self.forcasts = forcasts;
        completion(forcasts, nil);
    }];
    [task resume];
}

@end
