//
//  MUForecast.h
//  WeatherObjC
//
//  Created by Moin Uddin on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUForecast : NSObject

-(instancetype) initWithCity:(NSString *)city temperature:(NSNumber *)temperature image:(UIImage *)image;

-(instancetype) initWithCity:(NSString *)city dictionary:(NSDictionary *)dictionary;


@property NSString *city;
@property NSNumber *temperature;
@property UIImage *image;
@end

NS_ASSUME_NONNULL_END
