//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by macbook on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecast : NSObject

@property NSString *cityName;
@property int temperature;
@property UIImage *iconImage;

- (instancetype)initWithCityName:(NSString *)cityName
                     temperature:(int)temperature
                    iconImage:(UIImage *)weatherImage;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
                          cityName:(NSString *)cityName;

@end

NS_ASSUME_NONNULL_END
