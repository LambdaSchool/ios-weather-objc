//
//  IIIModel.m
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_34 on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIModel.h"

@implementation IIIModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        
        _name = dictionary[@"city"][@"name"];
        
        _temperature = [dictionary[@"temp"][@"day"]doubleValue];
        
        _icon = dictionary[@"weather"][@"icon"];
    }
    return self;
}

@end
