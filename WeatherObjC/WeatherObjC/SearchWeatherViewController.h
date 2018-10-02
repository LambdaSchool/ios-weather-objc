//
//  SearchWeatherViewController.h
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchWeatherViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

@property WeatherController *weatherController;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
