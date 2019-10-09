//
//  IIIDailyForecastController.h
//  WeatherObjC
//
//  Created by Michael Redig on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^IIIDailyForecastCompletionBlock)(NSArray *, NSError *);

@interface IIIDailyForecastController : NSObject

@property NSArray* forecasts;

@end
