//
//  IIIDailyForecast.m
//  WeatherObjC
//
//  Created by Nathanael Youngren on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIDailyForecast.h"
#import <UIKit/UIKit.h>

@implementation IIIDailyForecast

- (instancetype)initWithCityName:(NSString *)name temperature:(float)temperature andImage:(UIImage *)image {
    
    self = [super init];
    if (self) {
        _nameOfCity = name;
        _temperature = temperature;
        _icon = image;
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

        _icon = [UIImage imageNamed: imageName];
    }
    return self;
}

@end
