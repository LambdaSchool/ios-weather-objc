//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by Dennis Rudolph on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

- (instancetype)initByName:(NSString *)name
                     temperature:(NSNumber *)temperature
                            image:(UIImage *)image {
    if (self = [super init]) {
        _name = name;
        _temperature = temperature;
        _image = image;
    }
    return self;
}


- (instancetype)initByDictionary:(NSDictionary *)dictionary
                        cityName:(NSString *)name  {
    
    
    return self;
}


@end
