//
//  IIIDailyForecast.m
//  WeatherObjC
//
//  Created by Michael Redig on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIDailyForecast.h"

//NSData *loadFile(NSString *filename, NSBundle *bundle) {


NSURL* generateImageURL(NSString* iconName) {
	NSURL* baseURL = [NSURL URLWithString:@"http://openweathermap.org/img/wn/"];
//	http://openweathermap.org/img/wn/10d@2x.png
	NSString* nameFix = [NSString stringWithFormat:@"%@@2x", iconName];

	return [[baseURL URLByAppendingPathComponent:nameFix] URLByAppendingPathExtension:@"png"];
}


@implementation IIIDailyForecast

- (instancetype)initWithCityNamed:(NSString*)name withHighTemperature: (double)highTemperature withLowTemperature:(double)lowTemperature onDate:(NSDate*)date andIconName:(NSString*)iconName {
	if (self = [super init]) {
		_date = date;
		_cityName = name;
		_highTemperature = highTemperature;
		_lowTemperature = lowTemperature;
		_imageURL = generateImageURL(iconName);
	}
	return self;
}

+ (IIIDailyForecast*)forecastWithCityNamed:(NSString*) name withDictionaryRepresentation:(NSDictionary*) dictionary {

	NSNumber* timestamp = dictionary[@"dt"];
	NSDictionary* temperatures = dictionary[@"main"];
	NSNumber* highTempNumber = temperatures[@"temp_max"];
	NSNumber* lowTempNumber = temperatures[@"temp_min"];

	NSDictionary* weatherDict = dictionary[@"weather"][0];
	NSString* iconName = weatherDict[@"icon"];


	if (
		name != nil &&
		iconName != nil &&
		timestamp != nil &&
		highTempNumber != nil &&
		lowTempNumber != nil
		) {
		double highTemp = [highTempNumber doubleValue];
		double lowTemp = [lowTempNumber doubleValue];
		NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
		return [[IIIDailyForecast alloc] initWithCityNamed:name withHighTemperature:highTemp withLowTemperature:lowTemp onDate:date andIconName:iconName];

	} else {
		NSLog(@"Error decoding dictionary");
		return nil;
	}

	return nil;
}


@end
