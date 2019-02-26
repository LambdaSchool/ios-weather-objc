//
//  Forcast.m
//  WeatherObjC
//
//  Created by Benjamin Hakes on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "Forecast.h"
#import <UIKit/UIKit.h>

@implementation Forecast

- (instancetype)initWithName:(NSString *)cityName andTemperature:(NSNumber *)temperature andImageName:(NSString *)imageName{
    self = [super init];
    if (self) {
        _cityName = cityName;
        _temperature = temperature;
        _image = [UIImage imageNamed: imageName];
    }
    return self;
}


@end
