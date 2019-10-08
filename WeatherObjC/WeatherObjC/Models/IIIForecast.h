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

@property NSString *city;
@property double dayTemperature;
@property double nightTemperature;
@property NSString *weather;

@property (assign, nonatomic) UIImage *icon;

-(instancetype)initWithDict:(NSDictionary *)dictionary andCity:(NSString *)city;

@end

NS_ASSUME_NONNULL_END
