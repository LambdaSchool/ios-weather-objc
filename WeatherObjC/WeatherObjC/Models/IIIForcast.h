//
//  IIIForcast.h
//  WeatherObjC
//
//  Created by Hector Steven on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForcast : NSObject

@property NSString *zipCode;
@property NSString *name;
@property double temperature;
@property UIImage *icon;

- (instancetype)initWithZipCode:(NSString *)zipCode temperature:(double)temperature icon:(UIImage *)icon name:(NSString *)name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary zipcode:(NSString *)zipCode;

@end

NS_ASSUME_NONNULL_END
