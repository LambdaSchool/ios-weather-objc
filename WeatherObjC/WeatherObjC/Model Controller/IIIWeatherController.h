//
//  IIIWeatherController.h
//  WeatherObjC
//
//  Created by Marlon Raskin on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IIIWeatherController : NSObject

- (void)searchWeatherWithZipcode:(NSString *)zipcode completion:(void (^)(NSError *error))completion;

@property NSArray *forecasts;

@end
