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
                     temperature:(int *)temperature
                    weatherImage:(UIImage *)weatherImage {
    
    self = [super init];
    if (self) {
        
        _cityName = cityName;
        _temperature = temperature;
        _weatherImage = weatherImage;
    }
    return self;
}

@end
