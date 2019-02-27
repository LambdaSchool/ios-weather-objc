//
//  LMSForecast.h
//  WeatherObjC
//
//  Created by Lisa Sampson on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMSForecast : NSObject

- (instancetype)initWithName:(NSString *)name andTemperature:(NSNumber *)temperature andIconName:(NSString *)iconName;

- (instancetype)initWithName:(NSString *)name andDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSNumber *temperature;
@property (nonatomic, copy, readonly) UIImage *image;

@end

NS_ASSUME_NONNULL_END
