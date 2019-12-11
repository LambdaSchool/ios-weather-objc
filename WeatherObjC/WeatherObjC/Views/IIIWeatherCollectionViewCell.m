//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "IIIForcast.h"

@interface IIIWeatherCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

@implementation IIIWeatherCollectionViewCell

- (void)setForcast:(IIIForcast *)forcast {
    _forcast = forcast;
    
    [self updateViews];
}

- (void)updateViews {
    if (!self.forcast) return;
    
    float fahrenheit = self.forcast.temperature * (9.0/5.0) - 459.67;
    
    [self.temperatureLabel setText:[NSString stringWithFormat:@"%0.1f F", fahrenheit]];
    
    [self.weatherImageView setImage:self.forcast.image];
}

@end
