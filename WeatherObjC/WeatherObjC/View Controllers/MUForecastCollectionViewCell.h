//
//  MUForecastCollectionViewCell.h
//  WeatherObjC
//
//  Created by Moin Uddin on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUForecastCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *forecastImageView;
@property (weak, nonatomic) IBOutlet UILabel *forecastLabel;

@end

NS_ASSUME_NONNULL_END
