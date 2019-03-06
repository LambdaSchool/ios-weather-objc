//
//  DailyForecastController.h
//  WeatherObjC
//
//  Created by Ivan Caldwell on 3/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

// Objective-C version of type alias
typedef void (^CompletionHandler)(NSArray *, NSError *);
// Can never remember when I need a comma and when I don't ^^

NS_ASSUME_NONNULL_BEGIN

@interface DailyForecastController : NSObject
@property (nonatomic) NSArray *dailyForecasts;
- (void)fetchForecastForZipcode:(NSString *)zipcode completionBlock: (CompletionHandler)completionBlock;

@end

NS_ASSUME_NONNULL_END
