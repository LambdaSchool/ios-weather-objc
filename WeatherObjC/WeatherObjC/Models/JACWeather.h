//
//  JACWeather.h
//  WeatherObjC
//
//  Created by Jordan Christensen on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JACWeather : NSObject
@property NSString *name;
@property NSArray *temperature;
@property NSArray *imageName;

-(instancetype)initWithname:(NSString *)name
                temperature:(NSArray *)temperature
                  imageName:(NSArray *)imageName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
