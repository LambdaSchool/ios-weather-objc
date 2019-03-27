//
//  MJRViewController.h
//  WeatherObjC
//
//  Created by Moses Robinson on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJRWeatherController;

NS_ASSUME_NONNULL_BEGIN

@interface MJRViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate>

@property MJRWeatherController *weatherController;

@end

NS_ASSUME_NONNULL_END
