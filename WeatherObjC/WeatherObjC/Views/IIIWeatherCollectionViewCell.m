//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "JLRDailyForecast.h"

@interface IIIWeatherCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;


@end

@implementation IIIWeatherCollectionViewCell

- (void)setForecast:(JLRDailyForecast *)forecast
{
    _forecast = forecast;
    [self updateViews];
}

- (void)updateViews
{
    if (self.forecast)
    {
        self.weatherImageView.image = self.forecast.forecastImage;
        self.temperatureLabel.text = self.forecast.cityName;
    }
}
    @end
