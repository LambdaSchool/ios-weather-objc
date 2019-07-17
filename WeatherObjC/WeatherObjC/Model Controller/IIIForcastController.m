//
//  IIIForcastController.m
//  WeatherObjC
//
//  Created by Michael Flowers on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcastController.h"
#import "IIIForcast.h"

@implementation IIIForcastController

static NSString *baseURL = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString *apiKey = @"c5ff8a17ab55445062dc61918b6a9241";
//in the intializer of the model controller, give an initial value on an empty array for the forecasts property

- (instancetype) init {
    self = [super init];
    
    if (self){
        _forecasts = @[];
    }
    return self;
}

- (void)fetchForecastsWithSearchTerm:(NSString *)searchTerm
                     CompletionBlock:(IIIForecastCompletionBlock)completionBlock{
    //setup url
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURL];
    
    //Now that I have a reference to components I can set up the queryItems
    NSArray *queryItems = @[
                            [NSURLQueryItem queryItemWithName:@"zip" value:searchTerm],
                            [NSURLQueryItem queryItemWithName:@"APPID" value:apiKey]
                            ];
    //Still setting up the URL add the queryItems to the components
    urlComponents.queryItems = queryItems;
    
    //set the url
    NSURL *url = urlComponents.URL;
    //check to see if url is valid
    NSLog(@"This is the url: %@", url);
    
    //now that I have the url I can start the urlSession
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"DID THIS WORK");
        //Handle the errors
        if (error){
            NSLog(@"Error fetching forecasts: %@", error);
            completionBlock(nil,error);
            return;
        }
        
        //Serialize the data
        //1. create an address for the JSONError
        NSError *jsonError = nil;
        
        //2.initialize the jsonSerialization
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        //3.check to see if we have a json error
        if (jsonError){
            NSLog(@"JsonError: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        NSLog(@"json: %@", json);
        
        //need to get the array of lists of days back
        NSArray *listOfDays = json[@"list"];
        
        //create a mutable array to hold the days we get back from the network call
        NSMutableArray *days =[[NSMutableArray alloc] init];
        
        //use a for loop to pull out the days and to initialize them
        for(NSDictionary *dict in listOfDays){
            //call the dictonary initializer
            IIIForcast *day = [[IIIForcast alloc] initWithDictionary:dict]; //now we have a day
            if (day){
                //if day exists. days.append()
                [days addObject:day];
                NSLog(@"day city name: %@", day.city);
            }
        }
        NSLog(@"DAYS COUNT: %lu", days.count);
        completionBlock(days, nil);
    }];
    [task resume];
}
@end
