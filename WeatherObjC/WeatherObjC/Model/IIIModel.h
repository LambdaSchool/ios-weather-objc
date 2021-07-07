//
//  IIIModel.h
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_34 on 4/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIModel : NSObject

// init
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) double temperature;
@property (nonatomic, readonly) NSString *icon;



@end

NS_ASSUME_NONNULL_END
