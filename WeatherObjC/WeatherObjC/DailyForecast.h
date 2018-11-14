//
//  DailyForecast.h
//  WeatherObjC
//
//  Created by Daniela Parra on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyForecast : NSObject

- (instancetype)initWithCity:(NSString *)city lowTemperature:(NSNumber *)lowTemperature highTemperature:(NSNumber *)highTemperature forecast:(UIImage *)image;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary cityName:(NSString *)cityName;

@property NSString *city;
@property NSNumber *lowTemperature;
@property NSNumber *highTemperature;
@property UIImage *forecastImage;

@end
