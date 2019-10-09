//
//  IIIDailyForecast.h
//  WeatherObjC
//
//  Created by Michael Redig on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IIIDailyForecast : NSObject

@property NSString* cityName;
@property double highTemperature;
@property double lowTemperature;
@property NSURL* imageURL;
@property NSDate* date;

- (instancetype)initWithCityNamed:(NSString*)name withHighTemperature: (double)highTemperature withLowTemperature:(double)lowTemperature onDate:(NSDate*)date andIconName:(NSString*)iconName;

+ (IIIDailyForecast*)forecastWithCityNamed:(NSString*) name withDictionaryRepresentation:(NSDictionary*) dictionary;


@end

