//
//  NELWeatherController.h
//  WeatherObjC
//
//  Created by Nelson Gonzalez on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NELWeatherController : NSObject

- (void)getWeatherForCity:(NSString *)cityName completion:(void (^)(NSArray *forecasts, NSError *error))completion;


//@property NSMutableArray *forecasts;

@end

NS_ASSUME_NONNULL_END
