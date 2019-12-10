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
    
    [self.temperatureLabel setText:[NSString stringWithFormat:@"%0.2f K", self.forcast.temperature]];
}

@end
