//
//  JACWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Jordan Christensen on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JACWeatherCollectionViewCell.h"

@implementation JACWeatherCollectionViewCell
- (void) updateImageWithName:(NSString *)imageName temperature:(NSString *)temperature {
    _weatherImageView.image = [UIImage imageNamed:imageName];
    _temperatureLabel.text = temperature;
}
@end
