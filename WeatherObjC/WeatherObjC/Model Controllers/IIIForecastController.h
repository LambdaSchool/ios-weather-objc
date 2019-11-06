//
//  IIIForecastController.h
//  WeatherObjC
//
//  Created by Jeffrey Santana on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IIIWeatherApiKey;
@class IIIForecastController;

typedef void(^myCompletion)(BOOL);

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecastController : NSObject

@property IIIWeatherApiKey *apiKey;
@property NSString *city;
@property NSMutableArray *forecastArray;

- (void)fetchForecastForZipCode:(NSString *)zip
completitionBlock:(myCompletion)completionBlock;

@end

NS_ASSUME_NONNULL_END
