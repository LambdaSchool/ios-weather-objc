//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by Dennis Rudolph on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecast : NSObject

@property NSString *name;
@property NSNumber *temperature;
@property UIImage *image;

- (instancetype)initByName:(NSString *)name
                     temperature:(NSNumber *)temperature
                            image:(UIImage *)image;

- (instancetype)initByDictionary:(NSDictionary *)dictionary
                          cityName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
