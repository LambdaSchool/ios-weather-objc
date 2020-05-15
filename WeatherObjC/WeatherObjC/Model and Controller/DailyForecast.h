//
//  DailyForecast.h
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_268 on 5/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DailyForecast : NSObject

@property (nonatomic, assign) NSString *city;
@property (nonatomic, assign) NSNumber *temperature;
@property (nonatomic, assign) NSString *icon;


@end

NS_ASSUME_NONNULL_END
