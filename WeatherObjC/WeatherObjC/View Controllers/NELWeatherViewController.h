//
//  NELWeatherViewController.h
//  WeatherObjC
//
//  Created by Nelson Gonzalez on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NELWeatherController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NELWeatherViewController : UIViewController <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property NELWeatherController  *weatherController;

@end

NS_ASSUME_NONNULL_END
