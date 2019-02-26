//
//  ModelController.h
//  WeatherObjC
//
//  Created by Benjamin Hakes on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forecast.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^completionBlock)(Forecast *forecast, NSError *error);

@interface ModelController : NSObject

@property NSArray<Forecast *> *forecasts;

-(void)searchForecastForZip: (NSString *)zipCode withBlock:completionBlock;

@end

NS_ASSUME_NONNULL_END
