//
//  MUForecastCollectionViewCell.h
//  WeatherObjC
//
//  Created by Sean Hendrix on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUForecastCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *forecastImageView;
@property (weak, nonatomic) IBOutlet UILabel *forecastLabel;

@end

NS_ASSUME_NONNULL_END
