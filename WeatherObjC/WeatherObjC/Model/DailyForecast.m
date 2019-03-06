//
//  DailyForecast.m
//  WeatherObjC
//
//  Created by Ivan Caldwell on 3/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//  https://stackoverflow.com/questions/1801197/how-to-convert-nsnumber-objects-for-computational-purposes

#import "DailyForecast.h"

@implementation DailyForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary city:(NSString *)city {
    
    // I think this will work?? Maybe ? Please...
    double temperature = [dictionary[@"temp"][@"day"] doubleValue];
    // Get the name of the icon
    NSString *iconString = [dictionary[@"weather"] objectAtIndex: 0][@"icon"];
    // Set the icon with the iconString
    UIImage *icon = [UIImage imageNamed:iconString];
    
    return [self initWithCity: city temperature: temperature icon: icon];
}

- (instancetype)initWithCity:(NSString *)city temperature:(double)temperature icon:(UIImage *)icon {
    self = [super init];
    if (self) {
        _city = city;
        _temperature = temperature;
        _icon = icon;
    }
    return self;
}
@end
