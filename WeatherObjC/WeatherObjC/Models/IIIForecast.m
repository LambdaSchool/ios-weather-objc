//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by Jeffrey Santana on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

- (instancetype)initWithDict:(NSDictionary *)forecastDict {
	self = [super init];
	if (self) {
		NSDictionary *mainDict = forecastDict[@"main"];
		NSDictionary *weatherDict = [forecastDict[@"weather"] firstObject];
		
		NSNumber *timeInMilliSeconds = forecastDict[@"dt"];
		NSNumber *temp = mainDict[@"temp"];
		NSString *weatherString = weatherDict[@"icon"];
		
		if (timeInMilliSeconds != nil) {
			NSTimeInterval timeInSeconds = (NSTimeInterval)[timeInMilliSeconds longValue] / 1000;
			_date = [NSDate dateWithTimeIntervalSinceNow:timeInSeconds];
		}
		_temperature = temp != nil ? temp : 0;
		_icon = weatherString != nil ? [UIImage imageNamed:weatherString] : [UIImage imageNamed:@"01d"];
	}
	return self;
}

@end
