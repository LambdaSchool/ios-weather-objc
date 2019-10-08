//
//  IIIWeather.h
//  WeatherObjC
//
//  Created by Christopher Aronson on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIWeather : NSObject

@property NSString *cityName;
@property NSString *temp;
@property UIImage *weaatherImage;

- (instancetype) initWithCityName:(NSString *)cityName temp: (NSString *)temp weatherImage:(UIImage *)weatherImage;

- (instancetype) initWithJsonDictionary:(NSDictionary *)jsonDictionary;

@end

NS_ASSUME_NONNULL_END
