//
//  SKSWeather.h
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_204 on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SKSWeather : NSObject

@property NSString* name;
@property NSNumber* temp;
@property UIImage *image;

- (instancetype)initWithName:(NSString *)name temp:(NSNumber *)temp image:(UIImage *)image;

- (instancetype)initWithNameAndDictionary:(NSString *)name dictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
