//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by Thomas Cacciatore on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecast : NSObject

@property NSString *cityName;
@property double temperature;
@property UIImage *image;


- (instancetype)initWithCityName:(NSString *)cityName
                     temperature: (double)temperature
                           image:(UIImage *)image;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
                          cityName: (NSString *)cityName;

@end

NS_ASSUME_NONNULL_END
