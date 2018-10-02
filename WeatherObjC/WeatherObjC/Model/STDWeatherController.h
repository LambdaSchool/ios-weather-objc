//
//  STDWeatherController.h
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STDWeatherController : NSObject

- (instancetype)initWithArray:(NSMutableArray *)array;
- (void)getWeatherDataForZipCode:(NSString *)zipCode completion:(void (^)(NSError *))completion;
@property NSArray *forecasts;

@end

NS_ASSUME_NONNULL_END
