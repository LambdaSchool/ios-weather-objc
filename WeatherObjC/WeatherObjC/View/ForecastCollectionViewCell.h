//
//  ForcastCollectionViewCell.h
//  WeatherObjC
//
//  Created by Linh Bouniol on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForecastCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIImageView *forecastImageView;

@end

NS_ASSUME_NONNULL_END
