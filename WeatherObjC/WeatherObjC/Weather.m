//
//  Weather.m
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "Weather.h"

@implementation Weather

-(instancetype)initWithName:(NSString *)cityName temperature:(double)temperature imageName:(NSString *)imageName
{
    self = [super init];
    if (self)
    {
        _cityName = [cityName copy];
        _temperature = temperature;
        _image = [UIImage imageNamed:imageName];
    }
    
    return  self;
}

-(instancetype)initWithDictionary: (NSDictionary *)dictionary city: (NSString *)city
{
    NSDictionary *tempDict = dictionary[@"temp"];
    double temperature = [tempDict[@"day"]doubleValue];
    
    NSArray *weatherArray = dictionary[@"weather"];
    NSDictionary *weatherDictionary = [weatherArray firstObject];
    NSString *imageName = weatherDictionary[@"icon"];
    return [self initWithName:city temperature:temperature imageName:imageName];
}

@end
