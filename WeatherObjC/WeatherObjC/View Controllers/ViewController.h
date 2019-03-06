//
//  ViewController.h
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyForecastController.h"

@interface ViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

@property DailyForecastController * dailyForecastController;


@end

