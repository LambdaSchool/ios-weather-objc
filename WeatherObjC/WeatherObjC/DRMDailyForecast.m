//
//  DRMDailyForecast.m
//  WeatherObjC
//
//  Created by Dillon McElhinney on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "DRMDailyForecast.h"

@implementation DRMDailyForecast

- (instancetype)initFromCity: (NSString *)city andTemperature: (NSNumber *)temperature andIconName: (NSString *)iconName {
    self = [super init];
    if (self != nil) {
        [self setCity: city];
        [self setTemperature: temperature];
        [self setIcon:[UIImage imageNamed:iconName]];
    }
    
    return self;
}

- (instancetype)initWithDictionary: (NSDictionary *)dictionary andCity: (NSString *)city {
    
    NSNumber *temp = dictionary[@"temp"][@"day"];
    NSString *iconName = [dictionary[@"weather"] objectAtIndex: 0][@"icon"];
    
    return [self initFromCity: city andTemperature: temp andIconName: iconName];
}

@end
