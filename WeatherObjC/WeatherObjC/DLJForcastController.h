//
//  DLJForcastController.h
//  WeatherObjC
//
//  Created by Diante Lewis-Jolley on 7/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CompletionBlock)(NSDictionary *, NSError *);

@class DLJForcast;

@interface DLJForcastController : NSObject

@property NSMutableArray *weatherArray;

-(instancetype) init;

-(void)fetchForcastFromZip:(NSNumber *)zip withCompletion: (CompletionBlock)completion;


@end

NS_ASSUME_NONNULL_END
