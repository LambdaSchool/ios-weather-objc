//
//  YZIWeatherController.h
//  WeatherObjC
//
//  Created by Yvette Zhukovsky on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZIWeatherController : NSObject

@property (nonatomic) NSArray *forecasts ;

- (void)searchWithZip: (NSString *)searchTerm completion: (void (^)(NSArray *forecasts, NSError *error)) completion;

@end

NS_ASSUME_NONNULL_END
