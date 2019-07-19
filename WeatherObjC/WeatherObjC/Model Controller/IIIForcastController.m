//
//  IIIForcastController.m
//  WeatherObjC
//
//  Created by Hector Steven on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcastController.h"
#import "../Models/IIIForcast.h"
@interface IIIForcastController()

@property (nonatomic, copy) NSMutableArray *InternalForcasts;

@end



@implementation IIIForcastController

static NSString *baseUrl = @"https://api.openweathermap.org/data/2.5/forecast?zip=91006&appid=f4af2ee7c05b93312ef2b0f599df55bc";

- (instancetype)init{
	self = [super init];
	if (self) {
		_InternalForcasts = [[NSMutableArray alloc] init];
	}
	return self;
}

- (NSArray *)forcasts {
	return self.InternalForcasts;
}

- (void)fetchForcastFromZipCode:(NSString *)zipCode completionBlock:(IIIForcastFetcherCompletionBlock)completionBlock{
	NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.openweathermap.org/data/2.5/forecast?zip=%@&&units=imperial&cnt=7&appid=f4af2ee7c05b93312ef2b0f599df55bc", zipCode];
	NSLog(@"%@", urlString);
	
	NSURL *url = [[NSURL alloc] initWithString:urlString];
	
	NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			NSLog(@"error with url session: %@", error);
			completionBlock(error);
			return;
		}
		
		NSError *jsonError = nil;
		NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		if (jsonError){
			NSLog(@"Error wit jsonSerialization %@", jsonError);
			completionBlock(jsonError);
			return;
		}
		
		NSMutableArray *forcastArr = json[@"list"];
		
		for (NSDictionary *items in forcastArr) {
			NSString *name = json[@"city"][@"name"];
			NSString *temp = items[@"main"][@"temp"];
			NSString *icon = items[@"weather"][0][@"icon"];
			
			IIIForcast *forcast = [[IIIForcast alloc] initWithName:name temperature:temp icon:icon];
			[self.InternalForcasts addObject:forcast];
		}
	}];
	[task resume];
}

//- (void)fetchForcastWithCompletionBlock:(IIIForcastFetcherCompletionBlock)completionBlock{
//
//}

- (void) print_l:(NSString *)str{
	NSLog(@"%@", str);
}

@end



//http://openweathermap.org/img/w/01n.png
//static NSString *baseUrl = @"https://api.openweathermap.org/data/2.5/forecast?zip=91006&appid=f4af2ee7c05b93312ef2b0f599df55bc";
