//
//  IIIForcast.m
//  WeatherObjC
//
//  Created by Hector Steven on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcast.h"

@implementation IIIForcast

- (instancetype)initWithZipCode:(NSString *)zipCode temperature:(double)temperature icon:(UIImage *)icon {
	self = [super init];
	if (self) {
		_zipCode = zipCode;
		_temperature = temperature;
		_icon = icon;
	}
	return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary zipcode:(NSString *)zipCode {
	self = [super init];
	if (self) {
		_zipCode = zipCode;
		
		_temperature = [dictionary[@"temperature"] doubleValue];
		
		_icon = dictionary[@"icon"];
	}
	return self;
}

@end
