//
//  Weather.h
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Weather : NSObject

@property (nonatomic, copy, readonly) NSString *cityName;
@property (nonatomic, readonly) double temperature;
@property (nonatomic, copy, readonly) UIImage *image;

-(instancetype)initWithName: (NSString *)cityName temperature: (double)temperature imageName: (NSString *)imageName;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary city: (NSString *)city;

@end

NS_ASSUME_NONNULL_END
