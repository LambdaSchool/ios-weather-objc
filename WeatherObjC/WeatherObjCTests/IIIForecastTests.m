//
//  IIIForecastTests.m
//  WeatherObjCTests
//
//  Created by Gi Pyo Kim on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IIIFileHelper.h"
#import "IIIForecast.h"

@interface IIIForecastTests : XCTestCase

@end

@implementation IIIForecastTests

- (void)testParseForecastJSON {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSData *data = loadFile(@"Forecast.json", bundle);
    
    XCTAssertNotNil(data);
    
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error) {
        XCTFail(@"Error: %@", error);
    }
    
    NSLog(@"Forecast: %@", json);
    
    NSArray *results = json[@"list"];
    NSDictionary *sample = results[0];
    
    IIIForecast *forecast = [[IIIForecast alloc] initwithDictionary:sample cityName:@"Mountain View"];
    
    
    XCTAssertNotNil(forecast.cityName);
    XCTAssertNotNil(forecast.temperature);
    XCTAssertNotNil(forecast.date);
    XCTAssertNotNil(forecast.icon);
    
    
    
}



@end
