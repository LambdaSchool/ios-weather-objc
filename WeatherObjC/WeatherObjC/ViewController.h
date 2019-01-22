//
//  ViewController.h
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKTWeatherController.h"


@interface ViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate>


@property (nonatomic, copy, readonly) NKTWeatherController *weatherController;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

