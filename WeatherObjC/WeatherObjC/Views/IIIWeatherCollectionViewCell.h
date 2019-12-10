//
//  IIIWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLRDailyForecast;

NS_ASSUME_NONNULL_BEGIN

@interface IIIWeatherCollectionViewCell : UICollectionViewCell

- (void)updateViews;

@property (nonatomic, strong) JLRDailyForecast *forecast;

@end

NS_ASSUME_NONNULL_END
