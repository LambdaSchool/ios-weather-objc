//
//  HHWeather.h
//  WeatherObjC
//
//  Created by Hayden Hastings on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHWeather : NSObject

@property NSString *name;
@property NSString *temperature;
@property UIImage *image;

- (instancetype)initWithCityName:(NSString *)name temperature:(NSString *)temperature image:(UIImage *)image;
- (instancetype)initWithCityName:(NSString *)name dictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
