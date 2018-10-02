//
//  Forecast.h
//  WeatherObjC
//
//  Created by Linh Bouniol on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Forecast : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) double temperature;
@property (nonatomic, copy) NSString *imageName;

- (instancetype)initWithName:(NSString *)name temperature:(double)temperature imageName:(NSString *)imageName NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name; // this one calls on the above init

@end

NS_ASSUME_NONNULL_END
