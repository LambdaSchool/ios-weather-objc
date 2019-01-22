//
//  MUForecastController.h
//  WeatherObjC
//
//  Created by Sean Hendrix on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUForecastController : NSObject

-(void)searchForWeatherWithCity:(NSString *)cityName completion:(void (^)(NSArray *forecasts, NSError *))completion;

@property NSMutableArray *forecasts;

@end

NS_ASSUME_NONNULL_END
