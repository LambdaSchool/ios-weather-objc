//
//  Weather.m
//  WeatherObjC
//
//  Created by Sergey Osipyan on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "OSIWeather.h"


@implementation OSIWeather

- (instancetype)initWithName:(NSString *)name temperature:(double)temperature imageName:(NSString *)imageName
{
    if (self = [super init]) {
        _name = name.copy;
        _temperature = temperature;
        imageName = imageName.copy;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name
{
    NSDictionary *temp = dictionary[@"temp"];
    double temperature = [temp[@"day"] doubleValue];
    
    NSArray *weather = dictionary[@"weather"];
    NSDictionary *weatherForWeek = weather.firstObject;
    NSString *icon = weatherForWeek[@"icon"];
    
    
    return [self initWithName:name temperature:temperature imageName:icon];
}
@end
