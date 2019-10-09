//
//  IIIWeatherViewController.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class IIIForecastController;
@class IIIWeatherCollectionViewCell;

@interface IIIWeatherViewController : UIViewController <UICollectionViewDataSource, UISearchBarDelegate>
@property IIIForecastController *forecastController;

@end

NS_ASSUME_NONNULL_END
