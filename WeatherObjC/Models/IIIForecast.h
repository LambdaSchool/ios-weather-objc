//
//  IIIWeather.h
//  WeatherObjC
//
//  Created by Jonalynn Masters on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IIIForecast : NSObject

@property NSString *cityName;
@property NSNumber *temp;
@property NSString *weatherIcon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name;

@end
