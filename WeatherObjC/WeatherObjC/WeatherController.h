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

@property (nonatomic, copy, readonly) NSArray *forecasts;

//@property NSString *apiId;

-(void)searchForWeatherWithZipCode: (int)zipCode completion: (void (^)(NSError *))completion;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
