//
//  CGAForecast.m
//  WeatherObjC
//
//  Created by Conner on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "CGAForecast.h"

@implementation CGAForecast

- (instancetype)initWithCity:(NSString *)cityName temperature:(NSNumber *)temperature forecastIcon:(UIImage *)forecastIcon {
    self = [super init];
    if (self != nil) {
        _cityName = cityName;
        _temperature = temperature;
        _forecastIcon = forecastIcon;
    }
    return self;
}

@end
