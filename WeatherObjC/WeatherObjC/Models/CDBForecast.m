//
//  CDBForecast.m
//  WeatherObjC
//
//  Created by Ciara Beitel on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDBForecast.h"

@implementation CDBForecast

- (instancetype)initWithName:(NSString *)cityName temp:(NSString *)temperature image:(NSString *)image {
    self = [super init];
    if (self) {
        _cityName = cityName;
        _temperature = temperature;
        _image = [UIImage imageNamed:image];
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)city cityName:(NSString *)cityName {
    self = [super init];
    if (self) {
        _city = city;
        _cityName = cityName;
    }
}

@end
