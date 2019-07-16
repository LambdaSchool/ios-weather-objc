//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by Ryan Murphy on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecast : NSObject

- (instancetype)initWithCityName:(NSString *)name temperature:(float)temperature andImage:(UIImage *)image;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary cityName:(NSString *)name;

@property (copy, readonly, nonatomic) NSString *nameOfCity;
@property (nonatomic, readonly) float temperature;
@property (nonatomic, readonly) UIImage *iconImage;

@end

NS_ASSUME_NONNULL_END
