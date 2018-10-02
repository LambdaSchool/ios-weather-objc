//
//  STDWeatherViewController.h
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface STDWeatherViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

NS_ASSUME_NONNULL_END
