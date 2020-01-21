//
//  JBForecast.m
//  WeatherObjC
//
//  Created by Jon Bash on 2020-01-21.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "JBForecast.h"

@implementation JBForecast

-(instancetype)initWithCityName:(NSString *)cityName
                 temperatureInF:(double)temperatureInF
                      iconCode:(NSString *)iconCode {
    self = [super init];
    if (self) {
        _cityName = cityName;
        _temperatureInF = temperatureInF;
        _iconCode = iconCode;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)resultDict
                         cityName:(NSString *)cityName {
    NSDictionary *mainDict = resultDict[@"main"];
    NSArray *weatherArray = resultDict[@"weather"];
    NSDictionary *firstWeatherObject = [weatherArray firstObject];

    double temp = [[mainDict valueForKey:@"temp"] doubleValue];
    NSString *iconCode = firstWeatherObject[@"icon"];

    return [self initWithCityName:cityName temperatureInF:temp iconCode:iconCode];
}

@end
