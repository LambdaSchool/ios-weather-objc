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
		_city = city;
		
		NSDictionary *tempDict = forecastDict[@"city"];
		NSDictionary *weatherDict = forecastDict[@"weather"];
		
		NSNumber *dayTemp = tempDict[@"day"];
		NSNumber *nightTemp = tempDict[@"night"];
		NSString *mainWeather = weatherDict[@"main"];
		
		_dayTemperature = dayTemp != nil ? [dayTemp doubleValue] : 0;
		_nightTemperature = nightTemp != nil ? [nightTemp doubleValue] : 0;
		_weather = mainWeather != nil ? mainWeather : @"N/A";
	}
	return self;
}

//- (UIImage *)icon {
//	switch (<#expression#>) {
//		case <#constant#>:
//			<#statements#>
//			break;
//
//		default:
//			break;
//	}
//}

@end
