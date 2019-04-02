//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_95 on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast


- (instancetype)initWithName:(NSString *)name imageName:(NSString *)imageName temp:(double)temp {
    self = [super init];
    if (self) {
        _name = [name copy];
        _temp = temp;
        _icon = [UIImage imageNamed:imageName];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name dictionary:(NSDictionary *)dictionary {
    
    NSDictionary *tempDictionary = dictionary[@"temp"];
    double temp = [tempDictionary[@"day"] doubleValue];
    
    NSArray *weatherDictionaries = dictionary[@"weather"];
    NSDictionary *weatherDictionary = [weatherDictionaries firstObject];
    
    NSString *imageName = weatherDictionary[@"icon"];
    
    return [self initWithName:name imageName:imageName temp:temp];
}


@end
