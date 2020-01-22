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
                 temperatureInF:(NSNumber *)temperatureInF
                      iconCode:(NSString *)iconCode
                      timestamp:(NSDate *)timestamp {
    self = [super init];
    if (self) {
        _cityName = cityName;
        _temperatureInF = temperatureInF;
        _iconCode = iconCode;
        _iconImage = [UIImage imageNamed:iconCode];
        _timestamp = timestamp;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)resultDict
                         cityName:(NSString *)cityName {
    NSDictionary *mainDict = resultDict[@"main"];
    NSArray *weatherArray = resultDict[@"weather"];
    NSDictionary *firstWeatherObject = [weatherArray firstObject];
    NSTimeInterval timestampAsNumber = [resultDict[@"dt"] doubleValue];

    NSNumber *temp = [mainDict valueForKey:@"temp"];
    NSString *iconCode = firstWeatherObject[@"icon"];
    NSDate *timestamp = [NSDate dateWithTimeIntervalSince1970:timestampAsNumber];

    return [self initWithCityName:cityName
                   temperatureInF:temp
                         iconCode:iconCode
                        timestamp:timestamp];
}

@end
