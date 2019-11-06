//
//  HHWeather.m
//  WeatherObjC
//
//  Created by Hayden Hastings on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "HHWeather.h"

@implementation HHWeather

- (instancetype)initWithCityName:(NSString *)name temperature:(NSString *)temperature image:(UIImage *)image {
    self = [super init];
    if (self) {
        _name = name;
        _temperature = temperature;
        _image = image;
    }
    return self;
}

- (instancetype)initWithCityName:(NSString *)name dictionary:(NSDictionary *)dictionary {
    NSNumber *temperature = dictionary[@"main"][@"temp"];
    UIImage *weatherImage = [UIImage imageNamed:dictionary[@"weather"][0][@"icon"]];
    
    return [self initWithCityName:name temperature:temperature image:weatherImage];
}

@end
