//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "IIIForecast.h"

@implementation IIIWeatherCollectionViewCell

- (void)setForecast:(IIIForecast *)forecast {
    _forecast = forecast;
    
    [self updateView];
}

- (void)updateView {
    if (!self.forecast) { return; }
    
    self.weatherImageView.image = self.forecast.icon;
    self.temperatureLabel.text = [NSString stringWithFormat:@"%0.1f ℉", self.forecast.temperature.floatValue];
    self.timeLabel.text = self.forecast.date;
    
}

@end
