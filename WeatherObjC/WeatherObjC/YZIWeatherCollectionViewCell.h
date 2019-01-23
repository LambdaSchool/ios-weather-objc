//
//  YZIWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Yvette Zhukovsky on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZIWeatherCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *nameCity;



@end

NS_ASSUME_NONNULL_END
