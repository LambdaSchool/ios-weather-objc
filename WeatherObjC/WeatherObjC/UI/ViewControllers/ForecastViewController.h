//
//  ForecastViewController.h
//  WeatherObjC
//
//  Created by Benjamin Hakes on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ForecastViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBarAndSearchDisplayController;
@property (weak, nonatomic) IBOutlet ForecastCollectionView *forecastCollectionView;

@end

NS_ASSUME_NONNULL_END
