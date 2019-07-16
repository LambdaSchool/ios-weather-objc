//
//  IIIForcastController.m
//  WeatherObjC
//
//  Created by Hector Steven on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcastController.h"
#import "../Models/IIIForcast.h"


@implementation IIIForcastController

static NSString *baseUrl = @"https://api.openweathermap.org/data/2.5/forecast?zip=91006&appid=f4af2ee7c05b93312ef2b0f599df55bc";

- (void)fetchForcastFromZipCode:(NSString *)zipCode completionBlock:(IIIForcastFetcherCompletionBlock)completionBlock{

	NSURL *url = [[NSURL alloc] initWithString:baseUrl];
	NSLog(@"%@", url);
	
	NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error)
			NSLog(@"error with url session: %@", error);
		
	}];
	
	[task resume];
}

- (void)fetchForcastWithCompletionBlock:(IIIForcastFetcherCompletionBlock)completionBlock{
	
}

@end
