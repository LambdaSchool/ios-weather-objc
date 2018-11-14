//
//  MUForecastController.m
//  WeatherObjC
//
//  Created by Moin Uddin on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "MUForecastController.h"

@implementation MUForecastController

- (instancetype)initWithForecasts:(NSMutableArray *)forecasts
{
    self = [super init];
    if (self) {
        _forecasts = [NSMutableArray alloc];
    }
    return self;
}
@end
