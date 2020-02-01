//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "IIIForecast.h"
#import "UIKit/UIKit.h"

@interface IIIWeatherCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;


@end

@implementation IIIWeatherCollectionViewCell

- (void)updateViews
{
    if (self.forecast) {
        int cleanTemp = (int)floor([self.forecast.temperature doubleValue]);
        self.temperatureLabel.text = [NSString stringWithFormat:@"Temp: %d degrees", cleanTemp];
        self.weatherImageView.image = [UIImage imageNamed:self.forecast.forecastImageName];
    }
}

@end
