//
//  YZIWeather.m
//  WeatherObjC
//
//  Created by Yvette Zhukovsky on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "YZIWeather.h"


@implementation YZIWeather

-(instancetype)initWithCity:(NSString *)city temperature:(double)temperature weatherImage:(UIImage *)weatherImage
{
    self = [super init] ;
    
    if(self) {
        _city = city ;
        _temperature = temperature ;
        _weatherImage = weatherImage ;
   
    }
    return self ;
    
}


- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name
{
    NSDictionary *temp = dictionary[@"temp"];
    double temperature = [temp[@"day"] doubleValue];
    
    NSArray *weather = dictionary[@"weather"];
    NSDictionary *weatherDict = [weather firstObject];
    
    NSString *weatherIconString = weatherDict[@"icon"];
    UIImage *weatherImage = [UIImage imageNamed:weatherIconString];
    
    return [self initWithCity:name temperature:temperature weatherImage:weatherImage];
}



@end
