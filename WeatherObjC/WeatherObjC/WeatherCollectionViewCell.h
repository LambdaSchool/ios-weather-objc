//
//  WeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Daniela Parra on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *highTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTemperatureLabel;

@end

NS_ASSUME_NONNULL_END
