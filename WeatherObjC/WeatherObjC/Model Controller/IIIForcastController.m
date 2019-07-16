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

	
	
}

- (void)fetchForcastWithCompletionBlock:(IIIForcastFetcherCompletionBlock)completionBlock{
	
}

@end
