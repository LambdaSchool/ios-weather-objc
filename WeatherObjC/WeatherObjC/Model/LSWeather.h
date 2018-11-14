//
//  LSWeather.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSWeather : NSObject

- (instancetype)initWithCity: (NSString *)city temperature: (double)temperature forecastImage: (UIImage *)forecastImage;
- (instancetype)initWithDictionary: (NSDictionary *)dictionary name:(NSString *)name;

@property (nonatomic) NSString *city;
@property (nonatomic) double temperature;
@property (nonatomic) UIImage *forecastIcon;

@end

NS_ASSUME_NONNULL_END
