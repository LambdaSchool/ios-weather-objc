//
//  IIIForecastController.m
//  WeatherObjC
//
//  Created by Thomas Cacciatore on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecastController.h"

@implementation IIIForecastController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
