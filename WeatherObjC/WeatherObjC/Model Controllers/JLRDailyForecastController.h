//
//  JLRDailyForecastController.h
//  WeatherObjC
//
//  Created by Jesse Ruiz on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLRDailyForecastController : NSObject

- (void)searchForForecastWithZipCode:(NSString *)zipCode
                             completion:(void (^)(NSArray *forecasts, NSError *error))completion;
@end

NS_ASSUME_NONNULL_END
