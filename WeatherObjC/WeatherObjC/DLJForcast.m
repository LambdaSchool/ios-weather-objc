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

- (instancetype)initWithCity:(NSString *)city temperature:(NSString *)temperature weatherImage:(UIImage *)weatherImage
{
    self = [super init];
    if (self) {
        _city = city;
        _temperature = temperature;
        _weatherImage = weatherImage;
    }
    return self;
}


-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];

    if (self) {

        _city = [[dictionary objectForKey:@"city"] objectForKey:@"name"];

        NSArray *list = [dictionary objectForKey:@"list"];
        NSDictionary *listDictionary = [list objectAtIndex:0];
        NSDictionary *main = [listDictionary objectForKey:@"main"];

        double temperature = 0.0;

        temperature = [[main objectForKey:@"temp"] doubleValue];

        NSNumber *tempNSNumber = [NSNumber numberWithDouble:temperature];
        _temperature = [tempNSNumber stringValue];

        NSArray *weather = [listDictionary objectForKey:@"weather"];
        NSDictionary *weatherInfo = [weather objectAtIndex:0];

        _weatherImage = [UIImage imageNamed: [weatherInfo objectForKey:@"icon"]];
    }


    


    return self;
    }


@end
