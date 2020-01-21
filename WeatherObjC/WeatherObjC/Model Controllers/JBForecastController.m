//
//  JBForecastController.m
//  WeatherObjC
//
//  Created by Jon Bash on 2020-01-21.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "JBForecastController.h"

@implementation JBForecastController

static NSString *baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString *appID = @"88cbbc399e8121892ebc5e196a66400c";

-(instancetype)init {
    self = [super init];
    if (self) {
        _forecasts = @[];
    }
    return self;
}

@end
