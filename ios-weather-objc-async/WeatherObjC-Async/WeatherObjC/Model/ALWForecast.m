//
//  ALWForecast.m
//  WeatherObjC
//
//  Created by Audrey Welch on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "ALWForecast.h"

@implementation ALWForecast

- (instancetype)initWithName:(NSString *)name temp:(NSInteger)temp icon:(NSString *)icon {
    self = [super init];
    if (self) {
        _name = [name copy];
        _temp = temp;
        _icon = [icon copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name {
    _name = [name copy];
    NSString *temp = dictionary[@"temp"];
    NSString *icon = dictionary[@"icon"];
    
    return [self initWithName:name temp:temp icon:icon];
}

@end
