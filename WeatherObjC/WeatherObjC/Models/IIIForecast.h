//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by morse on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IIIForecast : NSObject

@property NSString *city;
@property NSString *temp;
@property NSString *icon;

- (instancetype)initWithCity:(NSString *)city
                  dictionary:(NSDictionary *)dictionary;

- (instancetype)initWithCity:(NSString *)city
                        temp:(NSString *)temp
                        icon:(NSString *)icon;

@end
