//
//  Forcast.h
//  WeatherObjC
//
//  Created by Benjamin Hakes on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Forecast : NSObject

- (instancetype)initWithName:(NSString *)cityName andTemperature:(NSNumber *)temperature andImageName:(NSString *)imageName;

- (instancetype)initWithName:(NSString *)cityName andDictionary: (NSDictionary *)dictionary;

@property NSString *cityName;
@property NSNumber *temperature;
@property UIImage *image;


@end

NS_ASSUME_NONNULL_END
