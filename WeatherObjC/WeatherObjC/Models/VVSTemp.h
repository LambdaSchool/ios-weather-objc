//
//  VVSTemp.h
//  WeatherObjC
//
//  Created by Vici Shaweddy on 2/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VVSTemp : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly) NSNumber *temp;
@property (nonatomic, readonly, copy) NSString *icon;


@end

