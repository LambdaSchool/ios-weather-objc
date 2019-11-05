//
//  JACWeather.m
//  WeatherObjC
//
//  Created by Jordan Christensen on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JACWeather.h"

@implementation JACWeather
-(instancetype)initWithname:(NSString *)name
                temperature:(NSArray *)temperature
                  imageName:(NSArray *)imageName {
    if (self = [super init]) {
        _name = name;
        _temperature = temperature;
        _imageName = imageName;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        NSString *name = [dictionary valueForKeyPath:@"city.name"];
        NSArray *list = dictionary[@"list"];
        NSMutableArray *imageNames = [[NSMutableArray alloc] init];
        NSMutableArray *temperatures = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in list) {
            NSNumber *temp = [dict valueForKeyPath:@"main.temp"];
            NSString *imageString = [dict valueForKeyPath:@"main.temp"];
            [imageNames addObject:imageString];
            [temperatures addObject:temp];
        }
        return [self initWithname:name temperature:temperatures imageName:imageNames];
    }
    return nil;
}
@end
