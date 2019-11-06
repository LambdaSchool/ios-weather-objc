//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by Marlon Raskin on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
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
