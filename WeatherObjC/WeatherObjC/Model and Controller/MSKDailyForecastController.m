//
//  DaileyForecastControler.m
//  WeatherObjC
//
//  Created by Lambda_School_Loaner_268 on 5/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "MSKDailyForecastController.h"
#import "MSKDailyForecast.h"

static NSString *baseURLString = @"api.openweathermap.org/data/2.5/forecast?";
static NSString *APIKey = @"867846b2a999753af04cf07ca01eae10";

@implementation MSKDailyForecastController

-(instancetype)init {
   _forecasts = @[];
    return self;
}

- (void)fetchForecastsUsingZip:(NSString *)zip CompletionBlock:(MSKForecastCompletionBlock)completionBlock {
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURLString];
    
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"zip=" value:zip],
        [NSURLQueryItem queryItemWithName:@"&AppID=" value:APIKey]
    ];
}
@end
