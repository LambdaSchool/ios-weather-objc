//
//  YZIWeather.h
//  WeatherObjC
//
//  Created by Yvette Zhukovsky on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZIWeather : NSObject

-(instancetype)initWithCity: (NSString *)city tempature: (double)termpature weatherImage: (UIImage *)weatherImage;
-(instancetype)initWithDictionary: (NSDictionary *)dictionary name: (NSString *)name ;
@property (nonatomic) NSString *city;
@property (nonatomic) double temperature;
@property (nonatomic) UIImage *weatherImage;

@end

NS_ASSUME_NONNULL_END
