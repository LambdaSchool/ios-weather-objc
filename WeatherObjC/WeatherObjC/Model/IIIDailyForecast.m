//
//  IIIDailyForecast.m
//  WeatherObjC
//
//  Created by Michael Redig on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIDailyForecast.h"

@interface IIIDailyForecast() {
	double _highTemperature;
	double _lowTemperature;
}

@end


@implementation IIIDailyForecast

- (instancetype)initWithCityNamed:(NSString*)name withHighTemperature: (double)highTemperature withLowTemperature:(double)lowTemperature onDate:(NSDate*)date andImageData:(NSData*)imageData {
	if (self = [super init]) {
		_date = date;
		_cityName = name;
		_highTemperature = highTemperature;
		_lowTemperature = lowTemperature;
		_imageData = imageData;
	}
	return self;
}

+ (IIIDailyForecast*)forecastWithCityNamed:(NSString*) name withDictionaryRepresentation:(NSDictionary*) dictionary {

	NSNumber* timestamp = dictionary[@"dt"];
	NSDictionary* temperatures = dictionary[@"temp"];
	NSNumber* highTempNumber = temperatures[@"max"];
	NSNumber* lowTempNumber = temperatures[@"min"];

	if (
		name != nil &&
		timestamp != nil &&
		highTempNumber != nil &&
		lowTempNumber != nil
		) {
		double highTemp = [highTempNumber doubleValue];
		double lowTemp = [lowTempNumber doubleValue];
		NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
		return [[IIIDailyForecast alloc] initWithCityNamed:name withHighTemperature:highTemp withLowTemperature:lowTemp onDate:date andImageData:nil];

	} else {
		NSLog(@"Error decoding dictionary");
		return nil;
	}

	return nil;
}

- (double)convertKelvinToFahrenheit:(double) kelvin {
	return (kelvin - 273.15) * (9.0 / 5.0) + 32;
}

- (double)highTemperature {
	return [self convertKelvinToFahrenheit:_highTemperature];
}

- (double)lowTemperature {
	return [self convertKelvinToFahrenheit:_lowTemperature];
}

@end
