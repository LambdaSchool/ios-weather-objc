//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by macbook on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

- (instancetype)initWithCityName:(NSString *)cityName
                     temperature:(int)temperature
                    iconImage:(UIImage *)weatherImage {
    
    self = [super init];
    if (self) {
        
        _cityName = cityName;
        _temperature = temperature;
        _iconImage = weatherImage;
    }
    return self;
}


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
                          cityName:(NSString *)cityName {
    
    int temperature = dictionary[@"temp"];
    UIImage *iconImage = dictionary[@"icon"];
    
    return [self initWithCityName:cityName temperature:temperature iconImage:iconImage];
}

@end
