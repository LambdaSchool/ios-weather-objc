//
//  JLCOneDayForcast.m
//  WeatherObjC
//
//  Created by Jake Connerly on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLCOneDayForcast.h"


@implementation JLCOneDayForcast

- (instancetype)initWithName:(NSString *)cityName temp:(double)temp image:(NSString *)icon {
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
    
    NSDictionary *weatherDictionary = dictionary[@"weather"];
    NSString *icon = weatherDictionary[@"icon"];
    
    return [self initWithName:cityName temp:temp image:icon];
}

@end
