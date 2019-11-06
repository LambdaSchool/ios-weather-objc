//
//  IIIWeatherViewController.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLCWeatherController.h"

@interface JLCWeatherViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate> 


@property JLCWeatherController *weatherController;
@property NSArray *forcasts;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
