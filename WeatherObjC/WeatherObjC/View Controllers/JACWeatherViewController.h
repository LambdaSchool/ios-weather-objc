//
//  IIIWeatherViewController.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JACWeatherController.h"

@interface JACWeatherViewController : UIViewController <UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property JACWeatherController *controller;
@end
