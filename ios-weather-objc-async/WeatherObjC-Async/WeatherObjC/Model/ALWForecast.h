//
//  ALWForecast.h
//  WeatherObjC
//
//  Created by Audrey Welch on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALWForecast : NSObject

- (instancetype)initWithName:(NSString *)name temp:(NSInteger)temp icon:(NSString *)icon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary city:(NSString *)city;

@property (nonatomic, copy) NSString *name; // "name"

// Inside "weather," which is an array of dictionaries
@property (nonatomic) NSInteger *temp; // "temp"
@property (nonatomic, copy) NSString *icon;

@end

NS_ASSUME_NONNULL_END
