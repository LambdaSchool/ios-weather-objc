//
//  JLCWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Jake Connerly on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLCOneDayForcast.h"

@interface JLCWeatherCollectionViewCell : UICollectionViewCell

@property (weak) IBOutlet UIImageView *imageView;
@property (weak) IBOutlet UILabel *tempLabel;
@property JLCOneDayForcast *forcast;

- (void)updateViews;

@end


