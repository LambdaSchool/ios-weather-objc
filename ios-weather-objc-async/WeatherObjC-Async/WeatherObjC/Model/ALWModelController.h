//
//  ALWModelController.h
//  WeatherObjC
//
//  Created by Audrey Welch on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALWModelController : NSObject

@property NSArray *forecasts;

- (void)searchForForecastWithZipCode:(NSString *)zipCode completion:(void (^)(NSArray* forecasts, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
