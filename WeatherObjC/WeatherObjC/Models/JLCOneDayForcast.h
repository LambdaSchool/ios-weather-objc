//
//  JLCOneDayForcast.h
//  WeatherObjC
//
//  Created by Jake Connerly on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLCOneDayForcast : NSObject

@property NSString *cityName;
@property double temp;
@property NSString *icon;
@property NSString *weatherDescription;

- (instancetype)initWithName:(NSString *)cityName
                        temp:(double)temp
                 imageString:(NSString *)icon
          weatherDescription:(NSString *)weatherDescription;
                

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

