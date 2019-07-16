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
@property double temperature;
@property UIImage *icon;

- (instancetype)initWithZipCode:(NSString *)zipCode temperature:(double)temperature icon:(UIImage *)icon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
