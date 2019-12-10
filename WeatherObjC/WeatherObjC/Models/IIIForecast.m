//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by Gi Pyo Kim on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast


- (instancetype)initWithCityName:(NSString *)cityName
                     temperature:(NSNumber *)temperature
                            date:(NSString *)date
                            icon:(UIImage *)icon {
    if (self = [super init]) {
        _cityName = cityName;
        _temperature = temperature;
        _date = date;
        _icon = icon;
    }
    return self;
}

//  icon format
//  https://openweathermap.org/img/wn/02d@2x.png


- (instancetype)initwithDictionary:(NSDictionary *)dictionary
                          cityName:(NSString *)cityName {
    NSDictionary *tempContainer = dictionary[@"main"];
    NSNumber *temperature = tempContainer[@"temp"];
    
    NSNumber *dateNumber = dictionary[@"dt"];
    
    NSDictionary *iconContainer = dictionary[@"weather"];
    NSString *iconString = iconContainer[@"icon"];
    
    // convert dt into NSDate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateNumber.intValue];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    // Make URL from icon string
    NSString *iconSizeString = @"@2x";
    NSURL *iconBaseURL = [NSURL URLWithString:@"https://openweathermap.org/img/wn/"];
    NSURL *iconURL = [iconBaseURL URLByAppendingPathComponent:(@"%@%@", iconString, iconSizeString)];
    iconURL = [iconURL URLByAppendingPathExtension:@"png"];
    
    NSLog(@"icon URL: %@", iconURL);
    
    // Make UIImage from URL
    NSData *iconData = [[NSData alloc] initWithContentsOfURL:iconURL];
    UIImage *iconImage = [[UIImage alloc] initWithData:iconData];
    
    return [self initWithCityName:cityName temperature:temperature date:dateString icon:iconImage];
}

@end
