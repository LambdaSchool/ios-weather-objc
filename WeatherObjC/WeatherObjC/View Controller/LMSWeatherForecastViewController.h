//
//  LMSWeatherForecastViewController.h
//  WeatherObjC
//
//  Created by Lisa Sampson on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMSForecastController;

NS_ASSUME_NONNULL_BEGIN

@interface LMSWeatherForecastViewController : UIViewController <UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *zipcodeSearchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *weatherCollectionView;

@property (nonatomic, copy, readonly) LMSForecastController *forecastController;

@end

NS_ASSUME_NONNULL_END
