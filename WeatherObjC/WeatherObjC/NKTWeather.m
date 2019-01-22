//
//  NKTWeather.m
//  WeatherObjC
//
//  Created by Nikita Thomas on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "NKTWeather.h"

@implementation NKTWeather

-(instancetype)initWithName:(NSString *)cityName temp:(double)temp image:(NSString *)image
{
    self = [super init];
    if (self)
    {
        _cityName = [cityName copy];
        _temp = temp;
        _image = [UIImage imageNamed:image];
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
    return [self initWithName:city temp:temperature image:imageName];
}


@end
