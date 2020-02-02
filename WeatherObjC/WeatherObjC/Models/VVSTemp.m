//
//  VVSTemp.m
//  WeatherObjC
//
//  Created by Vici Shaweddy on 2/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "VVSTemp.h"

@implementation VVSTemp

- (instancetype)initWithDictionary:(NSDictionary *)dictionary; {
    if (self = [super init]) {
        _date = [dictionary objectForKey:@"dt"];
        
        NSDictionary *main = [dictionary objectForKey:@"main"];
        
        _temp = [[main objectForKey:@"temp"] doubleValue];
        
        NSArray *weather = [dictionary objectForKey:@"weather"];
        _icon = [[weather firstObject] objectForKey:@"icon"];
    }
    return self;
}

@end
