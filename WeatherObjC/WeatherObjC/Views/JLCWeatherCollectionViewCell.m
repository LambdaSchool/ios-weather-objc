//
//  JLCWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Jake Connerly on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLCWeatherCollectionViewCell.h"
#import "JLCOneDayForcast.h"
#import <UIKit/UIKit.h>

@implementation JLCWeatherCollectionViewCell

- (void)updateViews {
    if (self.forcast != nil) {
        NSString *imageName = self.forcast.icon;
        UIImage *image = [UIImage imageNamed:imageName];
        self.imageView.image = image;
        self.tempLabel.text = [NSString stringWithFormat:@"%.f", self.forcast.temp];
    }
}
@end
