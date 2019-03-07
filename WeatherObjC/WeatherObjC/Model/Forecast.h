//
//  Forecast.h
//  

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Forecast : NSObject
    
// var city: String
// var temperature: Int
// var icon: UIImage
    
@property NSString *city;
@property int *temp;
@property (nonatomic, readonly, nullable) UIImage *icon;
    
// Initializer
- (instancetype)initWithCity:(NSString *)city temp:(int)temp icon:(UIImage *)icon;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
