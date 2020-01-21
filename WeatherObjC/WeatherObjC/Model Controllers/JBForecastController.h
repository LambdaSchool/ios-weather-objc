//
//  JBForecastController.h
//  WeatherObjC
//
//  Created by Jon Bash on 2020-01-21.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JBForecast.h"

@interface JBForecastController : NSObject

@property NSArray *forecasts;

-(instancetype)init;

-(void)fetchForecastsForZipCode:(NSString *)zipCode
                     completion:(void (^)(NSArray *forecasts, NSError *error))completion;

@end
