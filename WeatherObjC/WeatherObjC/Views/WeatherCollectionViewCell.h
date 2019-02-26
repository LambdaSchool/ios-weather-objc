//
//  WeatherCollectionViewCell.h
// 

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherCollectionViewCell : UICollectionViewCell

    @property (weak, nonatomic) IBOutlet UIImageView *imageView;
    
    @property (weak, nonatomic) IBOutlet UILabel *cityLabel;
    
    @property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
    
@end

NS_ASSUME_NONNULL_END
