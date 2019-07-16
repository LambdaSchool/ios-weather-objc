//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by Ryan Murphy on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
#import "IIIForecast.h"
#import <UIKit/UIKit.h>

@implementation IIIForecast

- (instancetype)initWithCityName:(NSString *)name temperature:(float)temperature andImage:(UIImage *)image {
    
    self = [super init];
    if (self) {
        _nameOfCity = name;
        _temperature = temperature;
        _iconImage = image;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary cityName:(NSString *)name {
    
    self = [super init];
    if (self) {
        _nameOfCity = name;
        
        double kelvinTemperature = [dictionary[@"temp"][@"day"] doubleValue];
        float fahrenheitTemperature = (kelvinTemperature - 273.15) * (9/5) + 32;
        
        _temperature = fahrenheitTemperature;
        
        NSString *imageName = [dictionary[@"weather"] firstObject][@"icon"];
        
        _iconImage = [UIImage imageNamed: imageName];
    }
    return self;
}

@end
