//
//  ModelController.h
//  WeatherObjC
//
//  Created by Benjamin Hakes on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forecast.h"

typedef void (^CompletionBlock)(Forecast *forecast, NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface ModelController : NSObject

@property NSArray<Forecast *> *forecasts;

-(instancetype)initWithArray:(NSMutableArray *)array;
-(void)searchForecastForZip: (NSString *)zipCode withBlock:(CompletionBlock)block;

@end

NS_ASSUME_NONNULL_END
