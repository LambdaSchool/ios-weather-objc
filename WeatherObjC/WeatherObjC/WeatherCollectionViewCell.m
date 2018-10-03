//
//  WeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "WeatherCollectionViewCell.h"
#import "Weather.h"

@implementation WeatherCollectionViewCell

- (void)updateViews
{
    if (self.weather != nil)
    {
        self.weatherImageView.image = self.weather.image;
        self.temperatureLabel.text = [NSString stringWithFormat:@"%.f", self.weather.temperature];
    }
}

@end
