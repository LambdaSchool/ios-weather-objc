//
//  STDWeather.m
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "STDWeather.h"

@implementation STDWeather

- (instancetype)initWithCity:(NSString *)city temperature:(float)temperature imageName:(NSString *)imageName date:(NSString *)date
{
    self = [super init];
    if (self) {
        _city = city;
        _temperature = temperature;
        _image = [UIImage imageNamed:imageName];
        _date = date;
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict city:(NSString *)city
{
    NSString *imageName = dict[@"weather"][0][@"icon"];
    NSNumber *tempNum = dict[@"temp"][@"day"];
    float temperature = [tempNum floatValue] - 273.15;
    NSNumber *dateNum = dict[@"dt"];
    double dateDouble = [dateNum doubleValue];
    // date conversion
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateDouble];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"EEEE";
    NSString *formattedDate = [formatter stringFromDate:date];
    //NSString *date = [NSString stringWithFormat:@"%@", dateNum];
    
    return [self initWithCity:city temperature:temperature imageName:imageName date:formattedDate];
}

@end
