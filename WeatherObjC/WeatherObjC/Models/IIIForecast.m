//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by Jeffrey Santana on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

- (instancetype)initWithDict:(NSDictionary *)forecastDict andCity:(NSString *)city {
	self = [super init];
	if (self) {
		NSDictionary *tempDict = forecastDict[@"temp"];
		NSDictionary *weatherDict = forecastDict[@"weather"];
		
		NSNumber *dayTemp = tempDict[@"day"];
		NSNumber *nightTemp = tempDict[@"night"];
		NSString *weatherString = weatherDict[@"icon"];
		
		_city = city;
		_dayTemperature = dayTemp != nil ? [dayTemp doubleValue] : 0;
		_nightTemperature = nightTemp != nil ? [nightTemp doubleValue] : 0;
		_icon = weatherString != nil ? [UIImage imageNamed:weatherString] : [UIImage imageNamed:@"01d"];
	}
	return self;
}

@end
