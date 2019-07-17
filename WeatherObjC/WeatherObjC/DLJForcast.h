//
//  DLJForcast.h
//  WeatherObjC
//
//  Created by Diante Lewis-Jolley on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLJForcast : NSObject

@property NSString *city;
@property NSString *temperature;
@property (nonatomic, readonly) UIImage *weatherImage;

-(instancetype) initWithDictionary:(NSDictionary *)dictionary city:(NSString *)city;

-(instancetype) initWithCity: (NSString *)city temperature: (NSString *)temperature image:(UIImage *)weatherImage;

@end

NS_ASSUME_NONNULL_END
