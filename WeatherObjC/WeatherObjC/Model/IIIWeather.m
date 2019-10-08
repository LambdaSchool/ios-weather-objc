//
//  IIIWeather.m
//  WeatherObjC
//
//  Created by Christopher Aronson on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeather.h"

@implementation IIIWeather

- (instancetype) initWithCityName:(NSString *)cityName temp: (NSString *)temp weatherImage:(UIImage *)weatherImage {
    self = [super init];
    
    if (self) {
        _cityName = cityName;
        _temp = temp;
        _weaatherImage = weatherImage;
    }
    
    return self;
}

- (instancetype) initWithJsonDictionary:(NSDictionary *)jsonDictionary {
    self = [super init];
    
    if (self) {
        _cityName = [[jsonDictionary objectForKey:@"city"] objectForKey:@"name"];

        NSArray *list = [jsonDictionary objectForKey:@"list"];
        NSDictionary *listDictionary = [list objectAtIndex:0];
        NSDictionary *main = [listDictionary objectForKey:@"main"];

        double temperature = 0.0;
        temperature = [[main objectForKey:@"temp"] doubleValue];
        
        NSNumber *temperatureNSNumber = [NSNumber numberWithDouble:temperature];
        _temp = [temperatureNSNumber stringValue];

        NSArray *weather = [listDictionary objectForKey:@"weather"];
        NSDictionary *weatherInfo = [weather objectAtIndex:0];
        
        _weaatherImage = [UIImage imageNamed:[weatherInfo objectForKey:@"icon"]];

    }
    
    return self;
}
@end
