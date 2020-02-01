//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by John Kouris on 2/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecast : NSObject

@property NSString *cityName;
@property NSNumber *temperature;
@property NSString *forecastImageName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
