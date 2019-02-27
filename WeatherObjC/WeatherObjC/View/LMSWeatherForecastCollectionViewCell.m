//
//  LMSWeatherForecastCollectionViewCell.m
//  WeatherObjC
//
//  Created by Lisa Sampson on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "LMSWeatherForecastCollectionViewCell.h"
#import "LMSForecast.h"

@implementation LMSWeatherForecastCollectionViewCell

- (void)updateViews
{
    if (self.forecast != nil) {
        self.iconImageView.image = self.forecast.image;
        self.tempLabel.text = [NSString stringWithFormat:@"%@", self.forecast.temperature];
    }
}

@end
