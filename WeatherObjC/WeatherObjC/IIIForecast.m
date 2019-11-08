//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by Michael Stoffer on 11/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecast.h"
#import <UIKit/UIKit.h>

@implementation IIIForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary Name:(NSString *)name
{
    if (self = [super init]) {
        double temp = [[[dictionary objectForKey:@"main"] objectForKey:@"temp"] doubleValue];
        NSString *icon = [[[dictionary objectForKey:@"weather"] objectAtIndex:0] objectForKey:@"icon"];
        
        _temp = temp;
        _name = name;
        _image = [UIImage imageNamed:icon];
    }
    
    return self;
}

@end
