//
//  IIIWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IIIForcast;

@interface IIIWeatherCollectionViewCell : UICollectionViewCell

@property (nonatomic) IIIForcast *forcast;

@end
