//
//  IIIForcastController.h
//  WeatherObjC
//
//  Created by Michael Flowers on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^IIIForecastCompletionBlock) (NSArray *, NSError *);

@interface IIIForcastController : NSObject
//add a property of an array of forecasts
@property NSArray *forecasts;

-(void)fetchForecastsWithSearchTerm:(NSString *)searchTerm
                  CompletionBlock:(IIIForecastCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
