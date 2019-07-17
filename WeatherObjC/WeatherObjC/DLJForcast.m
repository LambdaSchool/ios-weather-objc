//
//  DLJForcast.m
//  WeatherObjC
//
//  Created by Diante Lewis-Jolley on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "DLJForcast.h"
#import <UIKit/UIKit.h>

@implementation DLJForcast

- (instancetype)initWithCity:(NSString *)city temperature:(NSString *)temperature weatherImage:(UIImage *)weatherIcon
{
    self = [super init];
    if (self) {
        _city = city;
        _temperature = temperature;
        _weatherImage = weatherIcon;
    }
    return self;
}


-(instancetype)initWithDictionary:(NSDictionary *)dictionary city:(NSString *)city; {

    NSNumber *temperature = dictionary[@"main"][@"temp"];
    UIImage *weatherImage = [UIImage imageNamed:dictionary[@"weather"][0][@"icon"]];

    return [self initWithCity:city temperature:temperature image:weatherImage];

    



    }


@end
