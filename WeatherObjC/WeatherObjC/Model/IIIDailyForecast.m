//
//  IIIDailyForecast.m
//  WeatherObjC
//
//  Created by Bradley Yin on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIDailyForecast.h"


@implementation IIIDailyForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super self];
    if (self) {
        
        NSDictionary *temp = dictionary[@"temp"];
        NSNumber *dayTempNumber = temp[@"day"];
        
        NSArray *weatherArray = dictionary[@"weather"];
        NSDictionary *weatherDictionary = weatherArray[0];
        NSString *iconString = weatherDictionary[@"icon"];
        
        if (dayTempNumber && iconString) {
            _temperature = [dayTempNumber doubleValue];
            _icon = [UIImage imageNamed:iconString];
        } else {
            NSLog(@"Error: unable to parse dailyForecast: %@", dictionary);
            return nil;
        }
        
        
    }
    return self;
}

@end
