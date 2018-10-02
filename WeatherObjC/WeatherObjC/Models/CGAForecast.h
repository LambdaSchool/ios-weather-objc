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
- (instancetype)initWithCity:(NSString *)cityName temperature:(NSString *)temperature forecastIcon:(UIImage *)forecastIcon;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary city:(NSString *)city;

@property (nonatomic, copy, readonly) NSString *cityName;
@property (nonatomic, copy, readonly) NSString *temperature;
@property (nonatomic, copy, readonly) UIImage *forecastIcon;

@end

NS_ASSUME_NONNULL_END
