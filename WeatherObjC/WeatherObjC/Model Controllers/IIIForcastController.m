//
//  IIIForcastController.m
//  WeatherObjC
//
//  Created by Isaac Lyons on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcastController.h"
#import "IIIForcast.h"

@implementation IIIForcastController

static NSString *const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString *const apiKey = @"3b372a33fd3fddd0a953c2a0068af4a0";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forcasts = @[];
    }
    return self;
}

- (void)getForcastForZipCode:(NSString *)zipCode completion:(void (^)(NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *zipSearchItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *keySearchItem = [NSURLQueryItem queryItemWithName:@"APPID" value:apiKey];
    [components setQueryItems:@[zipSearchItem, keySearchItem]];
    
    NSURL *url = [components URL];
    NSLog(@"URL: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Data was nil");
            completion([[NSError alloc] init]);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(error);
            return;
        }
        
        NSDictionary *city = json[@"city"];
        NSString *cityName = city[@"name"];
        
        NSArray *results = json[@"list"];
        NSMutableArray *forcasts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dictionary in results) {
            IIIForcast *forcast = [[IIIForcast alloc] initWithDictionary:dictionary city:cityName];
            [forcasts addObject:forcast];
        }
        self.forcasts = forcasts;
        
        completion(nil);
        
    }];
    
    [task resume];
}

@end
