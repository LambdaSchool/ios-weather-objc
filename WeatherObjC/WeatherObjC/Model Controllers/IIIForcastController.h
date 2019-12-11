//
//  IIIForcastController.h
//  WeatherObjC
//
//  Created by Isaac Lyons on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IIIForcastController : NSObject

@property NSArray *forcasts;

- (instancetype)init;

- (void)getForcastForZipCode:(NSString *)zipCode
                  completion:(void (^)(NSError *error))completion;

@end
