//
//  main.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
static NSURL *baseURL;
static NSString *APIkey;

int main(int argc, char * argv[]) {
    @autoreleasepool {
        static NSString *baseURLString = @"api.openweathermap.org/data/2.5/forecast?";
        static NSString *APIKey = @"867846b2a999753af04cf07ca01eae10";
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
