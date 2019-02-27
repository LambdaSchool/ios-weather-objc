//
//  LMSForecast.m
//  WeatherObjC
//
//  Created by Lisa Sampson on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "LMSForecast.h"

@implementation LMSForecast

- (instancetype)initWithName:(NSString *)name andDictionary:(NSDictionary *)dictionary {
    
    NSNumber *temp = dictionary[@"temp"][@"day"];
    NSString *iconName = [dictionary[@"weather"] objectAtIndex: 0][@"icon"];
    
    return [self initWithName:name andTemperature:temp andIconName:iconName];
}

- (instancetype)initWithName:(NSString *)name andTemperature:(NSNumber *)temperature andIconName:(NSString *)iconName {
    self = [super init];
    if (self) {
        _name = [name copy];
        _temperature = [temperature copy];
        _image = [UIImage imageNamed:iconName];
    }
    return self;
}

@end
