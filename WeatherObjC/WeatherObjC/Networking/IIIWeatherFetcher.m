//
//  IIIWeatherFetcher.m
//  WeatherObjC
//
//  Created by Dongwoo Pae on 11/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherFetcher.h"
#import "IIIWeather.h"

static NSString *const WeatherFetcherBaseURLString = @"https://api.openweathermap.org/data/2.5/forecast";

@interface IIIWeatherFetcher ()

@end

@implementation IIIWeatherFetcher

-(void)fetchWeather: (WeatherFetcherCompletionHandler)completionHandler
{
    NSLog(@"Fetching weathersssssss");
    
    NSURLComponents *URLComponents = [[NSURLComponents alloc] initWithString:WeatherFetcherBaseURLString];
    
    NSMutableArray *queryItems = [NSMutableArray arrayWithObjects:
                                  [NSURLQueryItem queryItemWithName:@"zip" value:@"94040"],
                                  [NSURLQueryItem queryItemWithName:@"cnt" value:@"7"],
                                  [NSURLQueryItem queryItemWithName:@"appid" value:@"f144c855a01a9bd80c692dd246ed42e9"],nil];

    URLComponents.queryItems = queryItems;
    NSURL *URL = URLComponents.URL;
    
    //URLSession
    [[NSURLSession.sharedSession dataTaskWithURL:URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"started fetching weathers.....");
        
        if (error) {
            NSLog(@"Error fetching weathers: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        /* testing fetching using dummyString
        NSString *dummyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Dummy string: %@", dummyString);
        */
         
        NSError *jsonError = nil;
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        
        if (!results) {
            NSLog(@"Error decoding json: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            return;
        }
        
        //NSLog(@"all datas: %@", results);
        NSMutableArray *weathers = [[NSMutableArray alloc] init];
        
        //cityname
        NSDictionary *city = [results objectForKey:@"city"];
        NSString *name = [city objectForKey:@"name"];
        [weathers addObject:name];
        NSLog(@"print cityname: %@", name);
        
        
        //temp & weather
        NSArray *listDictionaries = [results objectForKey:@"list"];
    
        for (NSDictionary *dictionary in listDictionaries) {
            
            NSDictionary *main = [dictionary objectForKey:@"main"];
            NSNumber *temp = main[@"temp"];
            [weathers addObject:temp];
            NSArray *weather = [dictionary objectForKey:@"weather"];
            NSString *icon = weather[0][@"icon"];
            [weathers addObject:icon];
        }
        
        NSLog(@"weather temp and icon: %@", weathers);

        
    }] resume];
}

@end
