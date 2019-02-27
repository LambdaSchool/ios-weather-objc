//
//  DRMWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Dillon McElhinney on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DRMDailyForecast.h"

NS_ASSUME_NONNULL_BEGIN

@interface DRMWeatherCollectionViewCell : UICollectionViewCell

@property DRMDailyForecast *forecast;

@end

NS_ASSUME_NONNULL_END
