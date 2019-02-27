//
//  DRMForcastController.h
//  WeatherObjC
//
//  Created by Dillon McElhinney on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRMDailyForecast.h"

typedef void (^CompletionHandler)(NSError * error);

NS_ASSUME_NONNULL_BEGIN

@interface DRMForcastController : NSObject

@property NSArray *forecasts;

- (instancetype)init;

- (void)fetchForecastForZipcode: (NSString *)zipcode withCompletion: (CompletionHandler)completion;

@end

NS_ASSUME_NONNULL_END
