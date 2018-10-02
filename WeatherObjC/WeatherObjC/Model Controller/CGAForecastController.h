//
//  CGAForecastController.h
//  WeatherObjC
//
//  Created by Conner on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGAForecastController : NSObject

- (void)searchForForecastWithZipcode:(NSString *)zipcode completion:(void (^)(NSMutableArray *forecastsFromZipcode, NSError *))completion;

@property NSMutableArray *forecasts;

@end

NS_ASSUME_NONNULL_END
