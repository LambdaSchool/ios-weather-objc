//
//  LSMainViewController.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSWeatherController.h"


NS_ASSUME_NONNULL_BEGIN

@interface LSMainViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

@property LSWeatherController *weatherController;

@end

NS_ASSUME_NONNULL_END
