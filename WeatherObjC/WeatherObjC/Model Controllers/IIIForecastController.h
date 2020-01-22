//
//  IIIForecastController.h
//  WeatherObjC
//
//  Created by morse on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IIIForecastController : NSObject

- (void)searchForForecastsWithZipCode:(NSString *)zipCode
                           completion:(void (^)(NSArray *forcasts, NSError *error))completion;

@end
