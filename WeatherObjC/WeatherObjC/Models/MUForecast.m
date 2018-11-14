//
//  MUForecast.m
//  WeatherObjC
//
//  Created by Moin Uddin on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "MUForecast.h"

@implementation MUForecast
- (instancetype)initWithCity:(NSString *)city temperature:(int *)temperature image:(UIImage *)image
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
    NSString *temperature = dictionary[@"main"][@"temp"];
    UIImage *forecastImage = [UIImage imageNamed: dictionary[@"weather"][0][@"icon"] ];
    
    return [self initWithCity:city temperature:(int)temperature image:forecastImage];
}
@end
