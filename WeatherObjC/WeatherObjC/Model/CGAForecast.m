//
//  CGAForecast.m
//  WeatherObjC
//
//  Created by Conner on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "CGAForecast.h"

@implementation CGAForecast

- (instancetype)initWithCity:(NSString *)cityName temperature:(NSString *)temperature forecastIcon:(UIImage *)forecastIcon {
    self = [super init];
    if (self) {
        _cityName = cityName;
        _temperature = temperature;
        _forecastIcon = forecastIcon;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary city:(NSString *)city {
    NSString *cityName = city;
    NSString *temperature = dictionary[@"temperature"];
    UIImage *forecastIcon = [UIImage imageNamed:dictionary[@"icon"]];
    return [self initWithCity:cityName temperature:temperature forecastIcon:forecastIcon];
}

@end
