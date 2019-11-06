//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by Jeffrey Santana on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecast : NSObject

@property NSDate *date;
@property NSNumber *temperature;
@property UIImage *icon;

-(instancetype)initWithDict:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
