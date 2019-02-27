//
//  DRMWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Dillon McElhinney on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "DRMWeatherCollectionViewCell.h"

@interface DRMWeatherCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

@implementation DRMWeatherCollectionViewCell

- (DRMDailyForecast *)forecast {
    return [self forecast];
}

- (void)setForecast:(DRMDailyForecast *)forecast {
    forecast = forecast;
    [self.weatherImageView setImage: [forecast icon]];
    [self.cityLabel setText:[forecast city]];
    [self.temperatureLabel setText:[NSString stringWithFormat:@"%@", forecast.temperature]];
}

@end
