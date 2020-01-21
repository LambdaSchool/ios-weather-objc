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
@property double temperatureInF;
@property NSString *iconCode;

-(instancetype)initWithCityName:(NSString *)cityName
                 temperatureInF:(double)temperatureInF
                      iconCode:(NSString *)iconCode;

-(instancetype)initWithDictionary:(NSDictionary *)resultDict
                         cityName:(NSString *)cityName;

@end
