//
//  Weather.m
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "Weather.h"

@implementation Weather

-(instancetype)initWithName:(NSString *)cityName temperature:(NSString *)temperature imageName:(NSString *)imageName
{
    self = [super init];
    if (self)
    {
        _cityName = [cityName copy];
        _temperature = [temperature copy];
        _imageName = [imageName copy];
    }
    
    return  self;
}

-(instancetype)initWithDictionary: (NSDictionary *)dictionary city: (NSString *)city
{
    self = [super init];
    if (self)
    {
        _cityName = city;
    }
    
    return [self initWithDictionary:dictionary city:city];
}

@end
