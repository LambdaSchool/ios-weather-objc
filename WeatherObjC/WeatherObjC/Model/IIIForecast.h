//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_95 on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecast : NSObject

- (instancetype)initWithName:(NSString *)name dictionary:(NSDictionary *)dictionary;

- (instancetype)initWithName:(NSString *)name imageName:(NSString *)imageName temp:(double)temp;

@property NSString *name;
@property double temp;
@property UIImage *icon;

@end

NS_ASSUME_NONNULL_END
