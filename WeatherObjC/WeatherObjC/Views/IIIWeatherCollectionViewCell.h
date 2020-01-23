//
//  IIICollectionViewCell.h
//  WeatherObjC
//
//  Created by Jonalynn Masters on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IIIForecast;

@interface IIIWeatherCollectionViewCell : UICollectionViewCell

@property IIIForecast *forecast;
- (void)updateViews;

@end
