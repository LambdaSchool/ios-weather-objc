//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by John Pitts on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        _name = dictionary[@"city"][@"name"];
        
        _temp = NSArray[dictionary[@"temp"][@"day"]];
        
        _icon = dictionary[
        
        
        
        
        
        
        
    }
}

@end
