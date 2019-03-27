//
//  MJRWeatherController.h
//  WeatherObjC
//
//  Created by Moses Robinson on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJRWeatherController : NSObject

- (void)searchForWeatherWithZipcode:(NSString *)zipcode completion:(void (^)(NSError *error))completion;

@property NSArray *forecasts;

@end

NS_ASSUME_NONNULL_END
