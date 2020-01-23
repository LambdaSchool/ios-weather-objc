//
//  WeatherController.h
//  WeatherObjC
//
//  Created by Jonalynn Masters on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IIIWeatherController : NSObject

- (void)searchWeatherWithZipcode:(NSString *)zipcode completion:(void (^)(NSString *cityName, NSError *error))completion;

@property NSArray *forecasts;

@end
