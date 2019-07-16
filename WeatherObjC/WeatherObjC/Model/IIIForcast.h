//
//  IIIForcast.h
//  WeatherObjC
//
//  Created by Michael Flowers on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForcast : NSObject
//1. create your properties
@property NSString *city;
@property double temperature;
@property NSString *image;

//2. create the initializer - we want to initialize it with a dictionary because that's what we will get back from the api call. Json = dictionary
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(instancetype)initWithCity:(NSString *)city
                temperature:(double)temperature
                      image:(NSString *)image;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
                         city:(NSString *)city;

@end

NS_ASSUME_NONNULL_END
