//
//  HHWeatherController.h
//  WeatherObjC
//
//  Created by Hayden Hastings on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^HHWeatherControllerCompletionBlock)(NSArray *, NSError *);
@interface HHWeatherController : NSObject

- (void)fetchWeatherForCity:(NSString *)cityName completionBlock:(HHWeatherControllerCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
