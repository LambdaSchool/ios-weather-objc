//
//  JLCOneDayForcast.m
//  WeatherObjC
//
//  Created by Jake Connerly on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLCOneDayForcast.h"
#import "JLCWeather.h"


@implementation JLCOneDayForcast

- (instancetype)initWithName:(NSString *)cityName temp:(double)temp imageString:(NSString *)icon {
    if (self = [super init]) {
        _cityName = cityName;
        _temp = temp;
        _icon = icon;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *cityName = dictionary[@"name"];
    
    NSDictionary *mainDictionary = dictionary[@"main"];
    double temp = [mainDictionary[@"temp"] doubleValue];
    
    NSArray *weatherArray = dictionary[@"weather"];
    NSDictionary *individualWeatherDay = [weatherArray firstObject];
    NSString *icon = individualWeatherDay[@"icon"];
    NSLog(@"ICON: %@", icon);
    return [self initWithName:cityName temp:temp imageString:icon];
}

@end
