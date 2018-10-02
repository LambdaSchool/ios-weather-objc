//
//  Forecast.m
//  WeatherObjC
//
//  Created by Linh Bouniol on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "Forecast.h"

@implementation Forecast

- (instancetype)initWithName:(NSString *)name temperature:(double)temperature imageName:(NSString *)imageName
{
    if (self = [super init]) {
        _name = name.copy; // if do self.name = name, it does the copy for you
        _temperature = temperature; // no .copy b/c its not a class, anything with * is a class
        _imageName = imageName.copy;
    }
    
    return self;
}

/*
 For this project, you need to create two arguments: one for the dictionary, one for just the city name
 extract "day" from "temp", and "icon" from "weather", and they are both in the "list"
 
 In here, you are only taking care of the dictionary of info that represents the forecast.
 the code in the initWithDictionary can be done inside the loop that goes through the "list" in modelController
 */

- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name
{
    NSDictionary *temp = dictionary[@"temp"];
    double temperature = [temp[@"day"] doubleValue];
    
    NSArray *weather = dictionary[@"weather"];
    NSDictionary *firstWeather = weather.firstObject;
    NSString *icon = firstWeather[@"icon"];
    
    return [self initWithName:name temperature:temperature imageName:icon];
}

@end
