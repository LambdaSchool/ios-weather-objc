//
//  DailyForecast.h
//  WeatherObjC
//
//  Created by Ivan Caldwell on 3/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DailyForecast : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dictionary city:(NSString *)city;

- (instancetype)initWithCity:(NSString *)city
             temperature:(double)temperature
                    icon:(UIImage *)icon;
              //iconString:(NSString *)iconString;


@property (nonatomic, readonly, copy) NSString *city;
@property (nonatomic, readonly) double temperature;
@property (nonatomic) UIImage *icon;
@end

NS_ASSUME_NONNULL_END
