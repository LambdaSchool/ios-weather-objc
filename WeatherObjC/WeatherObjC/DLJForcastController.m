//
//  DLJForcastController.m
//  WeatherObjC
//
//  Created by Diante Lewis-Jolley on 7/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "DLJForcastController.h"
#import "DLJForcast.h"

@implementation DLJForcastController

static NSString *baseURL = @"https://api.openweathermap.org/data/2.5/forecast";

-(instancetype)init {
    self = [super init];

    if (self) {
        _weatherArray = [[NSMutableArray alloc] init];
    }

    return self;
}

-(void)fetchForcastFromZip:(NSNumber *)zip withCompletion:(CompletionBlock)completion {

    // Create components
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURL];

    //Query Items for url
    NSURLQueryItem *queryItems = @[
                                   [NSURLQueryItem queryItemWithName:@"zip" value:[zip stringValue]],
                                   [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"],
                                   [NSURLQueryItem queryItemWithName:@"APPID" value:@"aa535b3b1b6b719cbb69f0d80ae58bdc"]
                                   ];

    // Add Query Items to URL Compenents
    urlComponents.queryItems = queryItems;

    // Create URL
    NSURL *url = [urlComponents URL];

    NSURLSessionTask *fetchForcastSession = [[ NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error fetching Forcast Data: %@", error);
            completion(nil, error);
            return;
        }

        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) {
            NSLog(@"Error Converting json data: %@", jsonError);
            completion(nil, jsonError);
            return;
        }

        DLJForcast *forcast = [[DLJForcast alloc] initWithDictionary:json];
        [[self weatherArray] addObject:forcast];

        completion(json, nil);



    }];
    [fetchForcastSession resume];
}



@end
