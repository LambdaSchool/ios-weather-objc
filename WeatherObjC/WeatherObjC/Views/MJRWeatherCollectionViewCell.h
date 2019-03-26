//
//  MJRWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Moses Robinson on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJRWeatherCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *weatherImage;
@property (strong, nonatomic) IBOutlet UILabel *weatherLabel;

@end

NS_ASSUME_NONNULL_END
