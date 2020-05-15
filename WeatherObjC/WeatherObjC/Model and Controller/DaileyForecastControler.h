//
//  DaileyForecastControler.h
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_268 on 5/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DaileyForecastControler : NSObject

@property (nonatomic, assign) NSMutableArray *forcasts;

-(void)fetchForecastsUsingSearch:(NSString *)search
                                completionBlock()completionBlock

@end

NS_ASSUME_NONNULL_END
