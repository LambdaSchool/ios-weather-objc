//
//  VVSWeatherController.h
//  WeatherObjC
//
//  Created by Vici Shaweddy on 2/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VVSWeatherController : NSObject

- (void)searchForCityWithZipCode:(NSNumber *)zipCode
                      completion:(void (^)(NSArray *cities, NSError *error))completion;

@end

