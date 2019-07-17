//
//  IIIForcast.m
//  WeatherObjC
//
//  Created by Hector Steven on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcast.h"

@implementation IIIForcast

- (instancetype)initWithName:(NSString *)name temperature:(double)temperature icon:(UIImage *)icon {
	self = [super init];
	if (self) {
		_name = name;
		_temperature = temperature;
		_icon = icon;
	}
	return self;
}


//- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
//	self = [super init];
//	if (self) {
//
//		NSString *name = dictionary[@"city"][@"name"];
//
//		double temp = [dictionary[@"main"][@"temp"] doubleValue];
//
//		NSString *icon = dictionary[@"main"][@"weather"][@"icon"];
//
//	}
//	return [self init] initWithName:name temperature:doubl icon:<#(nonnull UIImage *)#>
//	return self;
//	//return [self init] initWithZipCode:zipCode temperature:<#(double)#> icon:<#(nonnull UIImage *)#>; //location
//}

@end
