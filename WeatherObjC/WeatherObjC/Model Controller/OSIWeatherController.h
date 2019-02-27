//
//  OSIWeatherController.h
//  WeatherObjC
//
//  Created by Sergey Osipyan on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSIWeather.h"

typedef void (^CompBlock)(OSIWeather *weather, NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface OSIWeatherController : NSObject

@property NSArray<OSIWeather *> *weatherForWeek;

- (instancetype)init;
- (void)searchWeatherUsingZipCode:(NSString *)zipCode withBlock:(CompBlock)block;


@end

NS_ASSUME_NONNULL_END
