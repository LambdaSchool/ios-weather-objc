//
//  IIIWeatherViewController.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLJForcastController.h"


@class DLJForcastController;

NS_ASSUME_NONNULL_BEGIN

@interface IIIWeatherViewController : UIViewController

@property DLJForcastController *forcastController;



@end

NS_ASSUME_NONNULL_END
