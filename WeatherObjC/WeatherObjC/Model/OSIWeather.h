//
//  Weather.h
//  WeatherObjC
//
//  Created by Sergey Osipyan on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSIWeather : NSObject


@property (nonatomic, copy) NSString *name;
@property (nonatomic) double temperature;
@property (nonatomic, copy) NSString *imageName;

- (instancetype)initWithName:(NSString *)name temperature:(double)temperature imageName:(NSString *)imageName;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name; 

@end
NS_ASSUME_NONNULL_END
