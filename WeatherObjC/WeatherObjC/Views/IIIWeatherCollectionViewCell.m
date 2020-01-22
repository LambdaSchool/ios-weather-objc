//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "SKSWeather.h"

@interface IIIWeatherCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;


@end

@implementation IIIWeatherCollectionViewCell

- (void)setCell:(SKSWeather *)weather
{
    self.weatherImageView.image = weather.image;
    self.temperatureLabel.text = [weather.temp stringValue];
}

@end
