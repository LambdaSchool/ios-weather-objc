//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by John Kouris on 2/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name
{
    if (self = [super init]) {
        NSNumber *temperature = dictionary[@"main"][@"temp"];
        NSString *forecastImageName = [dictionary[@"weather"] objectAtIndex:0][@"icon"];

        _forecastImageName = forecastImageName != nil ? forecastImageName : @"";
        _temperature = temperature != nil ? temperature : 0;
    }
    return self;
}

@end
