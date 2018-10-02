//
//  CGAForecast.h
//  WeatherObjC
//
//  Created by Conner on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGAForecast : NSObject
- (instancetype)initWithCity:(NSString *)cityName temperature:(NSNumber *)temperature forecastIcon:(UIImage *)forecastIcon;
//- (instancetype)initWithDictionary:(NSDictionary *)dictionary city:(NSString *)city;

@property NSString *cityName;
@property NSNumber *temperature;
@property UIImage *forecastIcon;

@end

NS_ASSUME_NONNULL_END
