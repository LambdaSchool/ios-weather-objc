//
//  ForecastController.h
//  WeatherObjC
//
//  Created by Linh Bouniol on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForecastController : NSObject

@property (nonatomic, copy) NSArray *forecasts;

- (void)loadForecastsForZipcode:(NSString *)zipcode completion:(void (^)(NSArray *forecasts, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
