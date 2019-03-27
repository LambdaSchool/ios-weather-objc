//
//  MJRWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Moses Robinson on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJRWeather;

NS_ASSUME_NONNULL_BEGIN

@interface MJRWeatherCollectionViewCell : UICollectionViewCell

- (void)updateViews;

@property (strong, nonatomic) IBOutlet UIImageView *weatherImage;
@property (strong, nonatomic) IBOutlet UILabel *weatherLabel;

@property MJRWeather *weather;

@end

NS_ASSUME_NONNULL_END
