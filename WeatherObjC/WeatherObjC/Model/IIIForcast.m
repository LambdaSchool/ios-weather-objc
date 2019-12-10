//
//  IIIForcast.m
//  WeatherObjC
//
//  Created by Isaac Lyons on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcast.h"

@implementation IIIForcast

- (instancetype)initWithCity:(NSString *)city temperature:(Float32)temperature image:(UIImage *)image {
    if (self = [super init]) {
        _city = city;
        _temperature = temperature;
        _image = image;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary city:(NSString *)city {
    NSNumber *temperature = dictionary[@"main"][@"temp"];
    
    return [self initWithCity:city temperature:[temperature floatValue] image:nil];
}

@end
