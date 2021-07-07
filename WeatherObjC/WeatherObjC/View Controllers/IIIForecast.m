//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by John Pitts on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

-(instancetype)initWithName:(NSString *)name
                       temp:(double *)temp
                       icon:(NSString *)icon {
    self = [super init];
    if (self) {
        
        _name = name;
        _temp = temp;
        _icon = icon;

    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        _name = dictionary[@"city"][@"name"];
        
        // someone else used NSNumber as return type
        _temp = [NSArray dictionary[@"main"][@"temp"]];
        
        _icon = dictionary[
        
    }
}

@end
