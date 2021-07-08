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

@property  (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy ) NSString *temperature;
@property (nonatomic, copy, readonly) UIImage *image;

- (instancetype)initWithName:(NSString *)name temperature:(NSString *)temperature icon:(NSString *)icon;

- (instancetype)initWithName:(NSString *)name dictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
