//
//  NKTWeatherCVC.h
//  WeatherObjC
//
//  Created by Nikita Thomas on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NKTWeather;
@interface NKTWeatherCVC : UICollectionViewCell

@property (nonatomic, strong) NKTWeather *weather;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *temp;

-(void)updateViews;


@end

NS_ASSUME_NONNULL_END
