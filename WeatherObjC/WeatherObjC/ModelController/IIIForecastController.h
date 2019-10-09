//
//  IIIForecastController.h
//  WeatherObjC
//
//  Created by Bradley Yin on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecastController : NSObject

typedef void (^IIIForecastFetcherCompletionBlock)(NSArray *, NSError *);

@property NSArray *forecasts;


@end

NS_ASSUME_NONNULL_END
