//
//  ViewController.h
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>


@class OSIWeatherController;
NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property NSArray *weatherArray;

@end

NS_ASSUME_NONNULL_END
