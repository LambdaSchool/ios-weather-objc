//
//  IIIDailyForecast.h
//  WeatherObjC
//
//  Created by Nathanael Youngren on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIDailyForecast : NSObject

- (instancetype)initWithCityName:(NSString *)name temperature:(float)temperature andImage:(UIImage *)image;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary cityName:(NSString *)name;

@property (copy, readonly, nonatomic) NSString *nameOfCity;
@property (nonatomic, readonly) float temperature;
@property (nonatomic, readonly) UIImage *icon;

@end

NS_ASSUME_NONNULL_END
