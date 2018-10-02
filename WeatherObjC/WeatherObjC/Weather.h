//
//  Weather.h
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Weather : NSObject

@property (nonatomic, copy, readonly) NSString *cityName;
@property (nonatomic, copy, readonly) NSString *temperature;
@property (nonatomic, copy, readonly) NSString *imageName;

-(instancetype)initWithName: (NSString *)cityName temperature: (NSString *)temperature imageName: (NSString *)imageName;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary city: (NSString *)city;

@end

NS_ASSUME_NONNULL_END
