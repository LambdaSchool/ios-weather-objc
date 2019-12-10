//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by Gi Pyo Kim on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecast : NSObject

@property NSString *cityName;
@property NSNumber *temperature;
@property UIImage *icon;

- (instancetype)initWithCityName:(NSString *)cityName
                     temperature:(NSNumber *)temperature
                            icon:(UIImage *)icon;

- (instancetype)initwithDictionary:(NSDictionary *)dictionary
                          cityName:(NSString *)cityName;

@end

NS_ASSUME_NONNULL_END
