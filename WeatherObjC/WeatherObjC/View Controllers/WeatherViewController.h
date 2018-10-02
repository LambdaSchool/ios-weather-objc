//
//  WeatherViewController.h
//  WeatherObjC
//
//  Created by Conner on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGAForecastController;

NS_ASSUME_NONNULL_BEGIN

@interface WeatherViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

@property CGAForecastController *forecastController;

@end

NS_ASSUME_NONNULL_END
