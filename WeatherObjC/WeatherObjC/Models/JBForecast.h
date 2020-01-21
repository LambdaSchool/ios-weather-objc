//
//  JBForecast.h
//  WeatherObjC
//
//  Created by Jon Bash on 2020-01-21.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBForecast : NSObject

@property NSString *cityName;
@property NSNumber *temperatureInF;
@property NSString *iconCode;
@property UIImage *iconImage;

-(instancetype)initWithCityName:(NSString *)cityName
                 temperatureInF:(NSNumber *)temperatureInF
                      iconCode:(NSString *)iconCode;

-(instancetype)initWithDictionary:(NSDictionary *)resultDict
                         cityName:(NSString *)cityName;

@end
