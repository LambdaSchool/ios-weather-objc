//
//  IIIForecastController.h
//  WeatherObjC
//
//  Created by Jeffrey Santana on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IIIWeatherApiKey;

typedef void (^ForecastCompletionBlock)(NSDictionary *_Nullable, NSError *_Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecastController : NSObject

@property IIIWeatherApiKey *apiKey;

- (void)fetchForecastForCity:(NSString *)cityId
completitionBlock:(ForecastCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
