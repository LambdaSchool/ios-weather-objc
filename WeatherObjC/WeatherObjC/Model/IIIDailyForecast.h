//
//  IIIDailyForecast.h
//  WeatherObjC
//
//  Created by Bradley Yin on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface IIIDailyForecast : NSObject

@property double temperature;
@property UIImage *icon;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


