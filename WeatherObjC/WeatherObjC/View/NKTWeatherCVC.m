//
//  NKTWeatherCVC.m
//  WeatherObjC
//
//  Created by Nikita Thomas on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "NKTWeatherCVC.h"
#import "NKTWeather.h"

@implementation NKTWeatherCVC

- (void)updateViews
{
    if (self.weather != nil)
    {
        self.image.image = self.image.image;
        self.temp.text = [NSString stringWithFormat:@"%.f", self.weather.temp];
    }
}


@end
