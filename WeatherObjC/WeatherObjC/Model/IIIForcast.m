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
    NSNumber *weatherId = dictionary[@"weather"][0][@"id"];
    
    UIImage *image;
    if (@available(iOS 13.0, *)) {
        switch ([weatherId intValue]) {
            case 200 ... 299:
                image = [UIImage systemImageNamed:@"cloud.bolt.rail"];
                break;
            case 300 ... 399 :
                image = [UIImage systemImageNamed:@"cloud.drizzle"];
                break;
            case 500 ... 599 :
                image = [UIImage systemImageNamed:@"cloud.rain"];
                break;
            case 600 ... 699 :
                image = [UIImage systemImageNamed:@"cloud.snow"];
                break;
            case 700 ... 799 :
                image = [UIImage systemImageNamed:@"sun.haze"];
                break;
            case 800 :
                image = [UIImage systemImageNamed:@"sun.max"];
                break;
            case 801 ... 899:
                image = [UIImage systemImageNamed:@"cloud.sun"];
                break;
            default:
                break;
        }
    }
    
    return [self initWithCity:city temperature:[temperature floatValue] image:image];
}

@end
