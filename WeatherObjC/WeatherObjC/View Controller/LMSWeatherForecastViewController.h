//
//  LMSWeatherForecastViewController.h
//  WeatherObjC
//
//  Created by Lisa Sampson on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMSWeatherForecastViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISearchBar *zipcodeSearchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *weatherCollectionView;


@end

NS_ASSUME_NONNULL_END
