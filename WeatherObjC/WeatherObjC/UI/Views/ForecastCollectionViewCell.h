//
//  ForecastCollectionViewCell.h
//  WeatherObjC
//
//  Created by Benjamin Hakes on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForecastCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *forecastImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *forecastLabel;

@end

NS_ASSUME_NONNULL_END
