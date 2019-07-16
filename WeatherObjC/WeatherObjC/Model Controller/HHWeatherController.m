//
//  HHWeatherController.m
//  WeatherObjC
//
//  Created by Hayden Hastings on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "HHWeatherController.h"

@implementation HHWeatherController

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString * const apiKey = @"14cb40aeaa54152e2db5015c9830c260";

- (void)fetchWeatherForCity:(NSString *)cityName completionBlock:(HHWeatherControllerCompletionBlock)completionBlock {
    
}
@end
