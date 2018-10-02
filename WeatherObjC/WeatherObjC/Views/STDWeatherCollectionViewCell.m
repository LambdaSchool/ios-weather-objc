//
//  STDWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "STDWeatherCollectionViewCell.h"

@implementation STDWeatherCollectionViewCell

- (void) updateViews
{
    [_weatherImageView setImage:_forecast.image];
    [_weatherTextLabel setText:[NSString stringWithFormat:@"%.2f", _forecast.temperature]];
    [_dayTextLabel setText:_forecast.date];
    self.view.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    self.view.clipsToBounds = YES;
    self.view.layer.borderWidth = 2;
    self.view.layer.cornerRadius = 5;
    self.view.layer.borderColor = [[UIColor grayColor] CGColor];
}

@end
