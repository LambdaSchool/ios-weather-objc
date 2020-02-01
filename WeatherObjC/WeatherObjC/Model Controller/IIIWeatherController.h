//
//  IIIWeatherController.h
//  WeatherObjC
//
//  Created by John Kouris on 2/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIWeatherController : NSObject

@property NSArray *forecasts;

- (void)getForecastAtZipcode:(NSString *)zipcode completion:(void (^)(NSString *cityName, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
