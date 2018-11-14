//
//  LSWeather.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSWeather.h"

@implementation LSWeather

- (instancetype)initWithCity:(NSString *)city temperature:(double)temperature forecastImage:(UIImage *)forecastImage
{
    self = [super init];
    
    if (self) {
        _city = city;
        _temperature = temperature;
        _forecastIcon = forecastImage;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name
{
    NSDictionary *temp = dictionary[@"temp"];
    double temperature = [temp[@"day"] doubleValue];
    
    NSArray *weather = dictionary[@"weather"];
    NSDictionary *weatherDict = [weather firstObject];
    
    NSString *forecastIconString = weatherDict[@"icon"];
    UIImage *forecastImage = [UIImage imageNamed:forecastIconString];
    
    return [self initWithCity:name temperature:temperature forecastImage:forecastImage];
}

@end
