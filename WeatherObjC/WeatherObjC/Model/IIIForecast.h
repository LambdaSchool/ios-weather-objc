//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by Marlon Raskin on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IIIForecast : NSObject

@property NSString *cityName;
@property NSNumber *temp;
@property NSString *weatherIcon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name;

@end
