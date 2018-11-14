//
//  DailyForecast.m
//  WeatherObjC
//
//  Created by Daniela Parra on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "DailyForecast.h"

@implementation DailyForecast

- (instancetype)initWithCity:(NSString *)city lowTemperature:(NSNumber *)lowTemperature highTemperature:(NSNumber *)highTemperature forecast:(UIImage *)image
{
    self = [super init];
    if (self) {
        
        _city = city;
        _lowTemperature = lowTemperature;
        _highTemperature = highTemperature;
        _forecastImage = image;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary cityName:(NSString *)cityName
{
    NSDictionary *tempDictionary = dictionary[@"temp"];
    NSNumber *lowTemperature = tempDictionary[@"min"];
    NSNumber *highTemperature = tempDictionary[@"max"];
    
    NSArray *weather = dictionary[@"weather"];
    NSString *iconString = [[weather firstObject] valueForKey:@"icon"];
    
    return [self initWithCity:cityName lowTemperature:lowTemperature highTemperature:highTemperature forecast:[UIImage imageNamed:iconString]];
}

@end
