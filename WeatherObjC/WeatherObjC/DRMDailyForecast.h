//
//  DRMDailyForecast.h
//  WeatherObjC
//
//  Created by Dillon McElhinney on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DRMDailyForecast : NSObject

@property NSString *city;
@property NSNumber *temperature;
@property UIImage *icon;

- (instancetype)initFromCity: (NSString *)city andTemperature: (NSNumber *)temperature andIconName: (NSString *)iconName;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary andCity: (NSString *)city;

@end

NS_ASSUME_NONNULL_END
