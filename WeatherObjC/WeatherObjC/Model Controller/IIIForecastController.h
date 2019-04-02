//
//  IIIForecastController.h
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_95 on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IIIForecast.h"

typedef void (^IIIForecastFetcherCompletionBlock)(NSError *_Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecastController : NSObject

- (instancetype)init;

- (void)fetchForecastsForZipCode:(int)zipcode completion:(void (^)(NSError *))completion;

/*- (void)fetchForecastAtZipcode:(int)zipcode
              completionBlock:(IIIForecastFetcherCompletionBlock)completionBlock;*/

@property NSArray *forecasts;

@end

NS_ASSUME_NONNULL_END
