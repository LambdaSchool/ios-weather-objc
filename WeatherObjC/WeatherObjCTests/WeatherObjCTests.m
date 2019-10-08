//
//  WeatherObjCTests.m
//  WeatherObjCTests
//
//  Created by Michael Redig on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"
#import "IIIDailyForecast.h"

@interface WeatherObjCTests : XCTestCase

@end

@implementation WeatherObjCTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (NSData*)testJSONFile {
	NSBundle* bundle = [NSBundle bundleForClass:[self class]];
	NSData* jsonData = loadFile(@"Forecast.json", bundle);
	return jsonData;
}

- (void)testFileHelper {
	NSData* jsonData = [self testJSONFile];

	XCTAssertNotNil(jsonData);
	NSLog(@"JSON: %@", jsonData);
}

- (void)testDailyForecast {
	NSData* jsonData = [self testJSONFile];

	NSError* error;
	NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];

	XCTAssertNotNil(jsonDict);
//	NSLog(@"JSON: %@", jsonDict);

	NSDictionary* cityDict = jsonDict[@"city"];
	NSString* cityName = cityDict[@"name"];

	NSArray* list = jsonDict[@"list"];
	NSDictionary* firstForecast = list[0];

	IIIDailyForecast* forecast = [IIIDailyForecast forecastWithCityNamed:cityName withDictionaryRepresentation:firstForecast];

	NSDate* expectedDate = [NSDate dateWithTimeIntervalSince1970:1519070400];

	XCTAssertEqualObjects(@"Mountain View", forecast.cityName);
	XCTAssertEqual(283.99, forecast.highTemperature);
	XCTAssertEqual(271.86, forecast.lowTemperature);
	XCTAssertEqualObjects(expectedDate, forecast.date);
	
}

@end
