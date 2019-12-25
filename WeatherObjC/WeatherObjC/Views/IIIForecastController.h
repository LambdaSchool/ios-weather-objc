//
//  IIIForecastController.h
//  WeatherObjC
//
//  Created by Ryan Murphy on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IIIForecast.h"

typedef void (^IIIDailyForecastFetcherCompletionBlock)(NSError *_Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecastController : NSObject

- (void)fetchForecastsWithZipCode:(NSString *)zipCode completion:(IIIDailyForecastFetcherCompletionBlock)completionBlock;

@property NSMutableArray *forecasts;

@end

NS_ASSUME_NONNULL_END
