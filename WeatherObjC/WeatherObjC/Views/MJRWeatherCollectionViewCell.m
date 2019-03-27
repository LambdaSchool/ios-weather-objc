//
//  MJRWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Moses Robinson on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "MJRWeatherCollectionViewCell.h"
#import "MJRWeather.h"

@implementation MJRWeatherCollectionViewCell

- (void)updateViews
{
    if (self.weather) {
        
        self.weatherLabel.text = [NSString stringWithFormat:@"%@ %@ degrees", self.weather.name, self.weather.temp];
        self.weatherImage.image = self.weather.icon;
    }
}

@end
