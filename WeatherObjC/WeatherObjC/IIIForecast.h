//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by Michael Stoffer on 11/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IIIForecast : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary Name:(NSString *)name;

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) NSNumber *temp;
@property (nonatomic, readonly) UIImage *image;

@end
