//
//  STDWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface STDWeatherCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *weatherTextLabel;
- (void) updateViews;

@end

NS_ASSUME_NONNULL_END
