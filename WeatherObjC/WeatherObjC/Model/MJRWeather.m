//
//  MJRWeather.m
//  WeatherObjC
//
//  Created by Moses Robinson on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "MJRWeather.h"

@implementation MJRWeather

-(instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name
{
    
    NSString *iconName = [dictionary[@"weather"] objectAtIndex:0][@"icon"];
    UIImage *icon = [UIImage imageNamed:iconName];
    NSNumber *temp = dictionary[@"main"][@"temp"];
    
    return [self initWithName:name icon:icon temp:temp];
}

-(instancetype)initWithName:(NSString *)name icon:(UIImage *)icon temp:(NSNumber *)temp
{
    
    self = [super init];
    
    if (self != nil) {
        _name = name;
        _icon = icon;
        _temp = temp;
    }
    return self;
}

@end
