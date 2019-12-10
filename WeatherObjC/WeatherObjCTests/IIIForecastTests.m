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
    
}



@end
