//
//  IIIForcastController.h
//  WeatherObjC
//
//  Created by Hector Steven on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void (^IIIForcastFetcherCompletionBlock)(NSArray *, NSError *);

@interface IIIForcastController : NSObject

- (void)fetchForcastFromZipCode:(NSString *)zipCode completionBlock:(IIIForcastFetcherCompletionBlock)completionBlock;

- (void)fetchForcastWithCompletionBlock:(IIIForcastFetcherCompletionBlock)completionBlock;

- (void) print_l:(NSString *)str;



@end

NS_ASSUME_NONNULL_END
