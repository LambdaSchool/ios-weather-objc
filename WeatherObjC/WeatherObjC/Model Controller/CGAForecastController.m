//
//  CGAForecastController.m
//  WeatherObjC
//
//  Created by Conner on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "CGAForecastController.h"

@implementation CGAForecastController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)searchForForecastWithZipcode:(NSString *)zipcode completion:(void (^)(NSMutableArray * _Nonnull, NSError * _Nonnull))completion {
    
}

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily?zip=";
static NSString * const apiKey = @"cec488a8c7c5da5bd1d463abe40c1dd3";

@end
