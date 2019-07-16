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
                            [NSURLQueryItem queryItemWithName:@"q" value:searchTerm],
                            [NSURLQueryItem queryItemWithName:@"country code" value:@"us"],
                            //this might have to be converted into a nsnumber?
                            [NSURLQueryItem queryItemWithName:@"cnt" value:@"1"],
                            [NSURLQueryItem queryItemWithName:@"APPID" value:@"c5ff8a17ab55445062dc61918b6a9241"]
                            ];
    //Still setting up the URL add the queryItems to the components
    urlComponents.queryItems = queryItems;
    
    //set the url
    NSURL *url = urlComponents.URL;
    //check to see if url is valid
    NSLog(@"This is the url: %@", url);
    
    //now that I have the url I can start the urlSession
}
@end
