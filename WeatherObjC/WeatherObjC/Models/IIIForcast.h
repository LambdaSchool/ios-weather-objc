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

@property NSString *name;
@property NSString *temperature;
@property UIImage *icon;

- (instancetype)initWithName:(NSString *)name temperature:(NSString *)temperature icon:(UIImage *)icon;

@end

NS_ASSUME_NONNULL_END
