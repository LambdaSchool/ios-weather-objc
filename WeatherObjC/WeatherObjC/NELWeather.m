//
//  NELWeather.m
//  WeatherObjC
//
//  Created by Nelson Gonzalez on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "NELWeather.h"

@implementation NELWeather

- (instancetype)initWithCityName:(NSString *)cityName temparature:(NSString *)temperature image:(UIImage *)image
{
    self = [super init];
    if (self) {
        _cityName = cityName;
        _temperature = temperature;
        _image = image;
    }
    return self;
}

@end
