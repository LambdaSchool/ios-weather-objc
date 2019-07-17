//
//  IIIForcast.m
//  WeatherObjC
//
//  Created by Hector Steven on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcast.h"

@implementation IIIForcast

- (instancetype)initWithName:(NSString *)name temperature:(NSString *)temperature icon:(UIImage *)icon {
	self = [super init];
	if (self) {
		_name = name;
		_temperature = temperature;
		_icon = icon; // needs to be image
	}
	return self;
}

@end
