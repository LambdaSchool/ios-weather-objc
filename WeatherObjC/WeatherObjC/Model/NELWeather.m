//
//  NELWeather.m
//  WeatherObjC
//
//  Created by Nelson Gonzalez on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "NELWeather.h"

@implementation NELWeather

- (instancetype)initWithCityName:(NSString *)cityName temparature:(NSString *)temperature image:(UIImage *)image
{
    self = [super init];
    if (self) {
        _cityName = cityName;
        _temperature = temperature;
        _image = image;
    }
    return self;
}

-(instancetype)initWithCityName:(NSString *)cityName dictionary:(NSDictionary *)dicitionary
{
    NSNumber *temperature = dicitionary[@"main"][@"temp"];
     UIImage *weatherImage = [UIImage imageNamed: dicitionary[@"weather"][0][@"icon"]];
    
    return [self initWithCityName:cityName temparature:temperature image:weatherImage];
}

@end
