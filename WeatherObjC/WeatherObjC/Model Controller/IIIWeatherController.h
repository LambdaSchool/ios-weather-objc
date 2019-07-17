//
//  IIIWeatherController.h
//  WeatherObjC
//
//  Created by Christopher Aronson on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CompletionBlock)(NSDictionary *, NSError *);

@class IIIWeather;

@interface IIIWeatherController : NSObject

@property NSMutableArray *weatherList;

- (instancetype) init;

- (void)fetchWeatherFromZip:(NSNumber *)zip withCompletion: (CompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
