//
//  IIIForcast.m
//  WeatherObjC
//
//  Created by Hector Steven on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcast.h"

@implementation IIIForcast

- (instancetype)initWithName:(NSString *)name temperature:(NSString *)temperature icon:(NSString *)icon{
	self = [super init];
	if (self) {
		_name = name;
		_temperature = temperature;
		_image = [UIImage imageNamed:icon];
	}
	return self;
}


- (instancetype)initWithName:(NSString *)name dictionary:(NSDictionary *)dictionary{
	
	NSString *dict_name = dictionary[@"city"][@"name"];
	NSString *dict_temp = dictionary[@"main"][@"temp"];
	NSString *dict_icon = dictionary[@"weather"][0][@"icon"];
	
	return [self initWithName:dict_name temperature:dict_temp icon:dict_icon];
}


@end
