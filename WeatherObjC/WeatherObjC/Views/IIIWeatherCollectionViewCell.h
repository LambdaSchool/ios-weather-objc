//
//  IIIWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IIIForecast;

NS_ASSUME_NONNULL_BEGIN

@interface IIIWeatherCollectionViewCell : UICollectionViewCell

- (void)updateViews;

@property IIIForecast *forecast;

@end

NS_ASSUME_NONNULL_END
