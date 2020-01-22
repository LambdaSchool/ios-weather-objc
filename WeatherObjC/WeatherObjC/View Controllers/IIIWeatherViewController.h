//
//  IIIWeatherViewController.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBForecastController.h"

@interface IIIWeatherViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

@property JBForecastController *forecastController;

@end
