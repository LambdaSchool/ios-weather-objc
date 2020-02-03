//
//  IIIWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IIIWeatherCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

