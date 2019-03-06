//
//  ALWViewController.h
//  WeatherObjC
//
//  Created by Audrey Welch on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALWModelController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ALWViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

//@property (nonatomic, strong, nullable) ALWPerson 

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property ALWModelController *modelController;

@end

NS_ASSUME_NONNULL_END
