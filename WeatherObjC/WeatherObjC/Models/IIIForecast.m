//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by morse on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

- (instancetype)initWithCity:(NSString *)city
                  dictionary:(NSDictionary *)dictionary {
    NSString *tempString = [NSString stringWithFormat:@"%@", dictionary[@"main"][@"temp"]];
    NSString *cityName = city;
    NSString *temp = tempString;
    NSString *icon = dictionary[@"weather"][@"icon"];
    
    return [self initWithCity:cityName temp:temp icon:icon];
    
}

- (instancetype)initWithCity:(NSString *)city
                        temp:(NSString *)temp
                        icon:(NSString *)icon {
    self = [super init];
    if (self) {
        
        _city = city;
        _temp = temp;
        _icon = icon;
    }
    return self;
}

@end
