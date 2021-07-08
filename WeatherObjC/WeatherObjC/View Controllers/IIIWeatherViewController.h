//
//  IIIWeatherViewController.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@class  IIIForcastController;
@class IIIForcast;

@interface IIIWeatherViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate>

@property IIIForcastController *forcastController;

@end

NS_ASSUME_NONNULL_END
