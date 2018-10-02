//
//  WeatherCollectionViewController.h
//  WeatherObjC
//
//  Created by Linh Bouniol on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ForecastController;

NS_ASSUME_NONNULL_BEGIN

@interface WeatherCollectionViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

@property (nonatomic) ForecastController *forecastController;

// other classes don't need to know about the outlets/actions
// outlets can go in the @interface in .m file, actions can go directly in the @implementaion in .m file
//@property (weak, nonatomic) IBOutlet UISearchBar *searchBar; 

@end

NS_ASSUME_NONNULL_END
