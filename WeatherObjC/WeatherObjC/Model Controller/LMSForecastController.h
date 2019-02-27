//
//  LMSForecastController.h
//  WeatherObjC
//
//  Created by Lisa Sampson on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionHandler)(NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface LMSForecastController : NSObject

@property (nonatomic, copy, readonly) NSArray *forecasts;

- (instancetype)init;
- (void)fetchForecastForZipcode: (NSString *)zipcode withCompletion: (CompletionHandler)completion;

@end

NS_ASSUME_NONNULL_END
