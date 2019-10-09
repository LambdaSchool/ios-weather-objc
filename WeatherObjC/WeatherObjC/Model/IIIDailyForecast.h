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
@property (readonly) double highTemperature;
@property (readonly) double lowTemperature;
@property NSData* imageData;
@property NSDate* date;

- (instancetype)initWithCityNamed:(NSString*)name withHighTemperature: (double)highTemperature withLowTemperature:(double)lowTemperature onDate:(NSDate*)date andImageData:(NSData*)imageData;

+ (IIIDailyForecast*)forecastWithCityNamed:(NSString*) name withDictionaryRepresentation:(NSDictionary*) dictionary;


@end

