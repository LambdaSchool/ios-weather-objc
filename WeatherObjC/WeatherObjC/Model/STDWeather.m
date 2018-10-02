//
//  STDWeather.m
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "STDWeather.h"

@implementation STDWeather

- (instancetype)initWithCity:(NSString *)city temperature:(float)temperature imageName:(NSString *)imageName
{
    self = [super init];
    if (self) {
        _city = city;
        _temperature = temperature;
        _image = [UIImage imageNamed:imageName];
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict city:(NSString *)city
{
    NSString *imageName = dict[@"weather"][0][@"icon"];
    NSNumber *tempNum = dict[@"temp"][@"day"];
    float temperature = [tempNum floatValue];
    
    return [self initWithCity:city temperature:temperature imageName:imageName];
}

@end
