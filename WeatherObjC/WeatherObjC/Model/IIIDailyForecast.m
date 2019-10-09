//
//  IIIDailyForecast.m
//  WeatherObjC
//
//  Created by Bradley Yin on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIDailyForecast.h"


@implementation IIIDailyForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary :(NSString *)cityName {
    self = [super self];
    if (self) {
        
        NSDictionary *main = dictionary[@"main"];
        NSNumber *dayTempNumber = main[@"temp"];
        
        NSArray *weatherArray = dictionary[@"weather"];
        NSDictionary *weatherDictionary = weatherArray[0];
        NSString *iconString = weatherDictionary[@"icon"];
        
        if (dayTempNumber && iconString) {
            _temperature = [dayTempNumber doubleValue];
            _icon = [UIImage imageNamed:iconString];
            _cityName = cityName;
        } else {
            NSLog(@"Error: unable to parse dailyForecast: %@", dictionary);
            return nil;
        }
        
        
    }
    return self;
}

@end
