//
//  JLRDailyForecast.h
//  WeatherObjC
//
//  Created by Jesse Ruiz on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLRDailyForecast : NSObject

@property NSString *cityName;
@property NSNumber *temp;
@property NSString *forecastImage;

- (instancetype)initWithName:(NSString *)cityName
                        temp:(NSNumber *)temp
               forecastImage:(NSString *)forecastImage;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
                          cityName:(NSString *)cityName;

@end

NS_ASSUME_NONNULL_END
