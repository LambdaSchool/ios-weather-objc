//
//  NKTWeather.h
//  WeatherObjC
//
//  Created by Nikita Thomas on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NKTWeather : NSObject

@property (nonatomic, copy, readonly) NSString *cityName;
@property (nonatomic, readonly) double temp;
@property (nonatomic, copy, readonly) UIImage *image;

-(instancetype)initWithName: (NSString *)cityName temp: (double)temp imageName: (NSString *)imageName;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary city: (NSString *)cityName;


@end

NS_ASSUME_NONNULL_END
