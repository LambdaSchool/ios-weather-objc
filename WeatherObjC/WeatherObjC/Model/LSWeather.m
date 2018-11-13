//
//  LSWeather.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSWeather.h"

@implementation LSWeather

- (instancetype)initWithCity:(NSString *)city temperature:(NSNumber *)temperature forecastImage:(UIImage *)forecastImage
{
    self = [super init];
    
    if (self) {
        _city = city;
        _temperature = temperature;
        _forecastIcon = forecastImage;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *city = dictionary[@"city"];
    NSNumber *temperature = dictionary[@"day"];
    NSString *forecastIconString = dictionary[@"main"];
    
    UIImage *forecastIcon = [UIImage imageNamed:forecastIconString];
    
    return [self initWithCity:city temperature:temperature forecastImage:forecastIcon];
}

@end
