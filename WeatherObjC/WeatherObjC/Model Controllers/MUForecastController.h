//
//  MUForecastController.h
//  WeatherObjC
//
//  Created by Moin Uddin on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUForecastController : NSObject

-(instancetype) initWithForecasts:(NSMutableArray *)forecasts;

@property NSMutableArray *forecasts;

@end

NS_ASSUME_NONNULL_END
