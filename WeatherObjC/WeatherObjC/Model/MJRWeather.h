//
//  MJRWeather.h
//  WeatherObjC
//
//  Created by Moses Robinson on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJRWeather : NSObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name;

-(instancetype)initWithName:(NSString *)name icon:(UIImage *)icon temp:(NSNumber *)temp;

@property NSString *name;
@property UIImage *icon;
@property NSNumber *temp;

@end

NS_ASSUME_NONNULL_END
