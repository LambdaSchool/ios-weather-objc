//
//  IIIForecastController.h
//  WeatherObjC
//
//  Created by Thomas Cacciatore on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IIIForecast.h"

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecastController : NSObject

typedef void (^IIIForcastFetcherCompletionBlock)(NSArray *, NSError *);
@property NSMutableArray *forecasts;
- (void)fetchForcastWithCityName:(NSString *)cityName
                 completionBlock:(IIIForcastFetcherCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
