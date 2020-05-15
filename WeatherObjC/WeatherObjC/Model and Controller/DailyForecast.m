//
//  DailyForecast.m
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_268 on 5/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "DailyForecast.h"

@implementation DailyForecast

-(instancetype) init {
    self = [super init];
    return self;
}
-(instancetype) initWithCity:(NSString *) city
                  dictionary:(NSDictionary *) dictionary  {
    self = [super init];
    if (self) {
        // city
        _city = city;
        // List Array
        NSArray *list = dictionary[@"list"];
        // List[0] Dict
        NSDictionary *list0 = list[0];
        // Main Dict
        NSDictionary *main = list0[@"main"];
        _temperature = main[@"temp"];
        // Weather Array
        NSArray *weather = list0[@"weather"];
        // Weather's Dict
        NSDictionary *weather0 = weather[0];
        _icon = weather0[@"icon"];
    }
    return self;
}

@end
