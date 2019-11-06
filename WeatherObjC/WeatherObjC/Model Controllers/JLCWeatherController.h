//
//  JLCWeatherController.h
//  WeatherObjC
//
//  Created by Jake Connerly on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLCWeatherController : NSObject

- (void)searchForWeatherByCity:(NSString *) cityName
                    completion:(void (^)(NSArray *weatherDays, NSError *error))completion;

@end

