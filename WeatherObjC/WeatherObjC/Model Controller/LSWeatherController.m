//
//  LSWeatherController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSWeatherController.h"

@implementation LSWeatherController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [[NSArray alloc] init];
    }
    return self;
}

@end
