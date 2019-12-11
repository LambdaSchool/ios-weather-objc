//
//  IIIForecastController.h
//  WeatherObjC
//
//  Created by Gi Pyo Kim on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IIIForecast.h"

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecastController : NSObject

@property NSMutableArray *forecasts;

- (void)searchCityWithZipCode:(NSString *)zipCode
                   completion:(void (^)(NSArray *Forecasts, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
