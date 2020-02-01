//
//  IIIWeatherViewController.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IIIWeatherController;

NS_ASSUME_NONNULL_BEGIN

@interface IIIWeatherViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate>

@property IIIWeatherController *weatherController;

@end

NS_ASSUME_NONNULL_END
