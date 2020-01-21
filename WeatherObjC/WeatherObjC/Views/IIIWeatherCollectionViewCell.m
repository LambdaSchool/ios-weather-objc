//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"

@interface IIIWeatherCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation IIIWeatherCollectionViewCell

static NSNumberFormatter *tempFormatter = nil;

+ (void)initialize {
    if (self == [IIIWeatherCollectionViewCell class]) {
        tempFormatter = [[NSNumberFormatter alloc] init];
        tempFormatter.maximumFractionDigits = 0;
        [tempFormatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    }
}

-(void)setForecast:(JBForecast *)forecast {
    _forecast = forecast;
    self.weatherImageView.image = forecast.iconImage;
    NSString *formattedTemp = [tempFormatter stringFromNumber:forecast.temperatureInF];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%@°F", formattedTemp];
}

@end
