//
//  WeatherController.h
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherController : NSObject

@property NSArray *forecasts;
@property NSString *apiId;
-(void)searchForWeatherWithZipCode: (NSString *)zipCode appID: (NSString *)apiId completion: (void (^)(NSArray *forecasts, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
