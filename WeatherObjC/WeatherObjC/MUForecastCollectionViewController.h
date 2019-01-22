//
//  MUForecastCollectionViewController.h
//  WeatherObjC
//
//  Created by Sean Hendrix on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MUForecastController;
NS_ASSUME_NONNULL_BEGIN

@interface MUForecastCollectionViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property MUForecastController *forecastController;
@end

NS_ASSUME_NONNULL_END
