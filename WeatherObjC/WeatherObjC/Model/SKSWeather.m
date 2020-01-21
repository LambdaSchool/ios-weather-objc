//
//  SKSWeather.m
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_204 on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "SKSWeather.h"

@implementation SKSWeather

- (instancetype)initWithName:(NSString *)name temp:(NSNumber *)temp image:(UIImage *)image
{
    self = [self init];
    if (self != nil) {
        _name = name;
        _temp = temp;
        _image = image;
    }
    return self;
}

- (instancetype)initWithNameAndDictionary:(NSString *)name dictionary:(NSDictionary *)dictionary
{
    NSString *cityName = dictionary[@"name"];
    NSNumber *temp = dictionary[@"temp"];
    NSString *imageName = dictionary[@"icon"];
    UIImage *image = [UIImage imageNamed:imageName];

    return [self initWithName:cityName temp:temp image:image];
}


@end
