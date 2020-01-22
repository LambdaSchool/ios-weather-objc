//
//  IIIWeather.m
//  WeatherObjC
//
//  Created by Jonalynn Masters on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name
{
    if (self = [super init]) {

        NSNumber *temp = dictionary[@"main"][@"temp"];
        NSString *weatherIcon = [dictionary[@"weather"] objectAtIndex:0][@"icon"];

        _weatherIcon = weatherIcon != nil ? weatherIcon : @"";
        _temp = temp != nil ? temp : 0;

    }
    return self;
}

@end
