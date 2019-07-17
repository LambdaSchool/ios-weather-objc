//
//  IIIForcast.m
//  WeatherObjC
//
//  Created by Hector Steven on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcast.h"

@implementation IIIForcast

- (instancetype)initWithZipCode:(NSString *)zipCode temperature:(double)temperature icon:(UIImage *)icon name:(NSString *)name{
	self = [super init];
	if (self) {
		_zipCode = zipCode;
		_temperature = temperature;
		_icon = icon;
		_name = name;
	}
	return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary zipcode:(NSString *)zipCode {
	self = [super init];
	if (self) {
		
		//_temperature = [dictionary[@"temperature"] doubleValue];
		
		//_icon = dictionary[@"icon"];
		
		//location
	}
	return self;
	//return [self init] initWithZipCode:zipCode temperature:<#(double)#> icon:<#(nonnull UIImage *)#>; //location
}

@end
