//
//  NKTWeatherController.h
//  WeatherObjC
//
//  Created by Nikita Thomas on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NKTWeatherController : NSObject

@property (nonatomic, copy, readonly) NSArray *forecasts;

-(void)searchForWeatherForZipCode: (int)zipCode completion: (void (^)(NSError *))completion;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
