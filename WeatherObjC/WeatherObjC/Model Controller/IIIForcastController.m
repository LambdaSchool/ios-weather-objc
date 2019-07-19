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

//http://openweathermap.org/img/w/01n.png
//static NSString *baseUrl = @"https://api.openweathermap.org/data/2.5/forecast?zip=91006&appid=f4af2ee7c05b93312ef2b0f599df55bc";

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
		
		NSMutableArray *fiveForcast = [[NSMutableArray alloc] init];
		NSMutableArray *forcastArr = json[@"list"];
		
		for (NSDictionary *items in forcastArr) {
			
			NSString *name = json[@"city"][@"name"];
			NSString *temp = items[@"main"][@"temp"];
			NSString *icon = items[@"weather"][0][@"icon"];
			
//			[self print_l:name];
//			[self print_l:temp];
//			[self print_l:icon];
//			NSLog(@"");
			
			IIIForcast *forcast = [[IIIForcast alloc] initWithName:name temperature:temp icon:icon];
			
			[fiveForcast addObject:forcast];
		}
		
		completionBlock(nil);
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
