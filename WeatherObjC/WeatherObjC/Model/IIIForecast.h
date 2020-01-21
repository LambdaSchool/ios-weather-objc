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
@property int *temperature;
@property UIImage *weatherImage;

- (instancetype)initWithCityName:(NSString *)cityName
                     temperature:(int *)temperature
                    weatherImage:(UIImage *)weatherImage;

@end

NS_ASSUME_NONNULL_END
