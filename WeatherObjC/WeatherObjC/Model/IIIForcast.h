//
//  IIIForcast.h
//  WeatherObjC
//
//  Created by Isaac Lyons on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IIIForcast : NSObject

@property NSString *city;
@property float temperature;
@property UIImage *image;

- (instancetype)initWithCity:(NSString *)city
                 temperature:(Float32)temperature
                       image:(UIImage *)image;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
                              city:(NSString *)city;

@end
