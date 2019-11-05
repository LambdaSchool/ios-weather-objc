//
//  JACWeatherController.h
//  WeatherObjC
//
//  Created by Jordan Christensen on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JACWeather.h"

@interface JACWeatherController : NSObject
- (void)fetchWeatherByZip:(NSNumber *)zipCode
               completion:(void (^)(JACWeather *weather, NSError *error))completion;
    @end
