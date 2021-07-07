//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by John Pitts on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecast : NSObject

@property NSString *name;
@property double *temp;
@property NSString *icon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
