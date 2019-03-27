//
//  MJRWeatherController.m
//  WeatherObjC
//
//  Created by Moses Robinson on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "MJRWeatherController.h"

@implementation MJRWeatherController








-(instancetype)init
{
    self = [super init];
    
    if (self != nil) {
        
        _forecasts = [[NSMutableArray alloc] init];
    }
    return self;
}

static NSString * const baseURLString = @"api.openweathermap.org/data/2.5/forecast";
static NSString * const apiKey = @"a81d985fb22ab301a7ee6d76ca01a14d";

@end
