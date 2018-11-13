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

- (instancetype)initWithCity: (NSString *)city temperature: (NSNumber *)temperature forecastImage: (UIImage *)forecastImage;
- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@property (nonatomic) NSString *city;
@property (nonatomic) NSNumber *temperature;
@property (nonatomic) UIImage *forecastIcon;

@end

NS_ASSUME_NONNULL_END
