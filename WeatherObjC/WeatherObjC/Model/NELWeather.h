//
//  NELWeather.h
//  WeatherObjC
//
//  Created by Nelson Gonzalez on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NELWeather : NSObject


- (instancetype)initWithCityName:(NSString *)cityName temparature:(NSString *)temperature image:(UIImage *)image;

- (instancetype)intiWithCityName:(NSString *)cityName dictionary:(NSDictionary *)dicitionary;


@property NSString *cityName;
@property NSString *temperature;
@property UIImage *image;


@end

NS_ASSUME_NONNULL_END
