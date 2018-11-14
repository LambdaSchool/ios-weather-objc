//
//  MUForecastCollectionViewCell.h
//  WeatherObjC
//
//  Created by Moin Uddin on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
//f144c855a01a9bd80c692dd246ed42e9

NS_ASSUME_NONNULL_BEGIN

@interface MUForecastCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *forecastImageView;
@property (weak, nonatomic) IBOutlet UILabel *forecastLabel;

@end

NS_ASSUME_NONNULL_END
