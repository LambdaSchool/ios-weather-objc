//
//  JLRDailyForecast.m
//  WeatherObjC
//
//  Created by Jesse Ruiz on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLRDailyForecast.h"

@implementation JLRDailyForecast

- (instancetype)initWithName:(NSString *)cityName
                        temp:(NSNumber *)temp
               forecastImage:(NSString *)forecastImage
{
    if (self = [super init])
    {
        _cityName = cityName;
        _temp = temp;
        _forecastImage = forecastImage;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *weatherDict = dictionary[@"weatherDict"];
    NSString *cityName = dictionary[@"cityName"];
    
    return [self initWithDictionary:weatherDict cityName:cityName];
}

@end
