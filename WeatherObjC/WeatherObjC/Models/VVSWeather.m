//
//  VVSWeather.m
//  WeatherObjC
//
//  Created by Vici Shaweddy on 2/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "VVSWeather.h"

@implementation VVSWeather

- (instancetype)initWithName:(NSString *)name
                       temps:(NSArray *)temps; {
    if (self = [super init]) {
        _name = name;
        _temps = temps;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary; {
    NSString *name = dictionary[@"city"][@"name"];
    NSMutableArray *temps = [NSMutableArray array];
    for (NSDictionary *tempDict in dictionary[@"list"]) {
        VVSTemp *temp = [[VVSTemp alloc] initWithDictionary:tempDict];
        [temps addObject:temp];
    }
    return [self initWithName:name temps:temps];
}

@end
