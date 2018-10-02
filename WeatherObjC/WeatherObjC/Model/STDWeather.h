//
//  STDWeather.h
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface STDWeather : NSObject

- (instancetype)initWithCity:(NSString *)city temperature:(float)temperature imageName:(NSString *)imageName;
- (instancetype)initWithDict:(NSDictionary *)dict city:(NSString *)city;

@property NSString *city;
@property float temperature;
@property UIImage *image;

@end

NS_ASSUME_NONNULL_END
