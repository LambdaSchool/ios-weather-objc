//
//  DailyForecastController.h
//  WeatherObjC
//
//  Created by Daniela Parra on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DailyForecastController : NSObject

- (void)getDailyForecastsFor:(NSString *)zipcode completion:(void (^) (NSArray  * _Nullable forecasts, NSError  * _Nullable ))completion;

@property NSArray *forecasts;

@end
