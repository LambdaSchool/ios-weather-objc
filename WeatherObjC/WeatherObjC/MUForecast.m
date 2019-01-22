//
//  MUForecast.m
//  WeatherObjC
//
//  Created by Sean Hendrix on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "MUForecast.h"

@implementation MUForecast
- (instancetype)initWithCity:(NSString *)city temperature:(NSNumber *)temperature image:(UIImage *)image
{
    self = [super init];
    if (self) {
        _city = city;
        _temperature = temperature;
        _image = image;
    }
    return self;
}

- (instancetype)initWithCity:(NSString *)city dictionary:(NSDictionary *)dictionary
{
    NSNumber *temperature = dictionary[@"main"][@"temp"];
    UIImage *forecastImage = [UIImage imageNamed: dictionary[@"weather"][0][@"icon"] ];
    
    return [self initWithCity:city temperature:temperature image:forecastImage];
}
@end
