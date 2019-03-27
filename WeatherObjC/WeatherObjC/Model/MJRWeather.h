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



@property NSString *name;
@property UIImage *icon;
@property double *temp;

@end

NS_ASSUME_NONNULL_END
