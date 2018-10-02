//
//  STDWeatherViewController.h
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STDWeathercontroller.h"

NS_ASSUME_NONNULL_BEGIN

@interface STDWeatherViewController : UIViewController<UICollectionViewDataSource, UISearchBarDelegate>

@property STDWeatherController *weatherController;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

NS_ASSUME_NONNULL_END
