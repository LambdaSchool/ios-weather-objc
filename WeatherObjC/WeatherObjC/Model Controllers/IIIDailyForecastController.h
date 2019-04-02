//
//  IIIDailyForecastController.h
//  WeatherObjC
//
//  Created by Nathanael Youngren on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IIIDailyForecast.h"

typedef void (^IIIDailyForecastFetcherCompletionBlock)(NSError *_Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface IIIDailyForecastController : NSObject

- (void)fetchForecastsWithZipCode:(NSString *)zipCode completion:(IIIDailyForecastFetcherCompletionBlock)completionBlock;

@property NSMutableArray *forecasts;

@end

NS_ASSUME_NONNULL_END
