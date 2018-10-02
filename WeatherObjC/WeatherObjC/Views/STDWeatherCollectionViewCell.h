//
//  STDWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STDWeather.h"

NS_ASSUME_NONNULL_BEGIN

@interface STDWeatherCollectionViewCell : UICollectionViewCell

@property STDWeather *forecast;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *weatherTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayTextLabel;
- (void) updateViews;

@end

NS_ASSUME_NONNULL_END
