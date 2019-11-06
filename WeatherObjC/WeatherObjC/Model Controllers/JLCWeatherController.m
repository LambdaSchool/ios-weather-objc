//
//  JLCWeatherController.m
//  WeatherObjC
//
//  Created by Jake Connerly on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLCWeatherController.h"

@implementation JLCWeatherController
static NSString *const baseURLString = @"https://api.openweathermap.org/data/2.5";

- (void)searchForWeatherByCity:(NSString *)cityName
                    completion:(void (^)(NSArray *, NSError *))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *cityToSearch = [NSURLQueryItem queryItemWithName:@"find" value:cityName];
    NSURLQueryItem *units = [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"];
    NSURLQueryItem *appID = [NSURLQueryItem queryItemWithName:@"appid" value:@"239cafdec8e45203f03203dad58b13aa"];
    [components setQueryItems:@[cityToSearch, units, appID]];
    
    NSURL *url = [components URL];
    NSLog(@"url: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
}

@end
