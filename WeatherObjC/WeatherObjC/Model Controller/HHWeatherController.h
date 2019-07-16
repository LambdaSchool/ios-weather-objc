//
//  HHWeatherController.h
//  WeatherObjC
//
//  Created by Hayden Hastings on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^HHWeatherControllerCompletionBlock)(NSArray *forecasts, NSError *error);
@interface HHWeatherController : NSObject

@property NSMutableArray *forecasts;

- (void)fetchWeatherForCity:(NSString *)cityName completionBlock:(HHWeatherControllerCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
