//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by Thomas Cacciatore on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

- (instancetype)initWithCityName:(NSString *)cityName temperature:(double)temperature image:(UIImage *)image {
    self = [super init];
    if (self) {
        _cityName = (NSString *)cityName;
        _temperature = (double)temperature;
        _image = (UIImage *)image;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary cityName:(NSString *)cityName {
    self = [super init];
    if (self) {
        _cityName = dictionary[@"city"][@"name"];
        _temperature = [dictionary[@"list"][@"temp"][@"day"] doubleValue];
        _image = dictionary[@"list"][@"weather"][@"icon"];
    }
    return self;
}


@end
