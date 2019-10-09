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
		NSDictionary *mainDict = forecastDict[@"main"];
		NSDictionary *weatherDict = [forecastDict[@"weather"] firstObject];
		
		NSNumber *temp = mainDict[@"temp"];
		NSString *weatherString = weatherDict[@"icon"];
		
		_city = city;
		_temperature = temp != nil ? temp : 0;
		_icon = weatherString != nil ? [UIImage imageNamed:weatherString] : [UIImage imageNamed:@"01d"];
	}
	return self;
}

@end
