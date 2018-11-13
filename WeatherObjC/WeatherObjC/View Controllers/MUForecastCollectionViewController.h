//
//  MUForecastCollectionViewController.h
//  WeatherObjC
//
//  Created by Moin Uddin on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUForecastCollectionViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
