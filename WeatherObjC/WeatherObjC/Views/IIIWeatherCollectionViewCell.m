//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "IIIDailyForecast.h"

@interface IIIWeatherCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;


@end

@implementation IIIWeatherCollectionViewCell

- (void)setForecast:(IIIDailyForecast *)forecast {
	_forecast = forecast;

	[self updateViews];
}

- (void)updateViews {
	self.temperatureLabel.text = [NSString stringWithFormat:@"%.02f", self.forecast.highTemperature];
}


@end
