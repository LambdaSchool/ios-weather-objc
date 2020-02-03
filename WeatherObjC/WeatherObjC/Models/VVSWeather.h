//
//  VVSWeather.h
//  WeatherObjC
//
//  Created by Vici Shaweddy on 2/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVSTemp.h"

@interface VVSWeather : NSObject

@property NSString *name;
@property NSArray<VVSTemp *> *temps;

- (instancetype)initWithName:(NSString *)name
                       temps:(NSArray *)temps;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

