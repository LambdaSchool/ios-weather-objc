//
//  JLRDailyForecast.h
//  WeatherObjC
//
//  Created by Jesse Ruiz on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLRDailyForecast : NSObject

@property (nonatomic, copy, readonly) NSString *cityName;
@property (nonatomic, copy, readonly) NSNumber *temp;
@property (nonatomic, copy, readonly) UIImage *forecastImage;

- (instancetype)initWithName:(NSString *)cityName
                        temp:(NSNumber *)temp
               forecastImage:(NSString *)forecastImage;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
                          cityName:(NSString *)cityName;

@end

NS_ASSUME_NONNULL_END
