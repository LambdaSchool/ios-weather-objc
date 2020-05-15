//
//  DaileyForecastControler.h
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_268 on 5/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSKDailyForecast.h"

NS_ASSUME_NONNULL_BEGIN
// Stub
//typedef void (^LSIQuakeFetcherCompletion)(NSArray<LSIQuake *> * _Nullable quakes, NSError * _Nullable error);
typedef void (^MSKForecastCompletionBlock)(NSMutableArray<MSKDailyForecast *> *_Nullable forecasts, NSError *_Nullable error);
@interface DaileyForecastController : NSObject

@property (nonatomic, assign) NSArray *forecasts;

-(void)fetchForecastsUsingSearch:(NSString *)search CompletionBlock:(MSKForecastCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
