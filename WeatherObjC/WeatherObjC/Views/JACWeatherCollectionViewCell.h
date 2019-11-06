//
//  JACWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Jordan Christensen on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JACWeatherCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

- (void) updateImageWithName:(NSString *)imageName temperature:(NSString *)temperature;

@end
