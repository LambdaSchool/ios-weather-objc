//
//  DaileyForecastControler.m
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_268 on 5/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "DaileyForecastController.h"


@implementation DaileyForecastController

-(instancetype)init {
   _forecasts = @[];
    return self;
}

- (void)fetchForecastsUsingSearch:(NSString *)search CompletionBlock:(MSKForecastCompletionBlock)completionBlock {
    
}
@end
