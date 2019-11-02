//
//  IIIForecastFetcher.h
//  WeatherObjC
//
//  Created by Michael Stoffer on 11/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ForecastFetcherCompletionHandler)(NSArray *forecasts, NSError *error);

@interface IIIForecastFetcher : NSObject

- (void)fetchForecasts:(id)city completionHandler:(ForecastFetcherCompletionHandler)completionHandler;

@end
