//
//  Forecast.m
//  

#import "Forecast.h"

@implementation Forecast
    
- (instancetype)initWithCity:(NSString *)city temp:(int)temp icon:(UIImage *)icon {
    self = [super init];
    if (self != nil) {
        _city = city;
        _temp = temp;
        _icon = icon;
    }
    return self;
}
    
//- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
//    NSString *city = dictionary[@"name"];
//    int *temp
//}

@end
