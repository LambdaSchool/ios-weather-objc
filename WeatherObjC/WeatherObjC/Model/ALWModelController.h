//
//  ALWModelController.h
//  

#import <Foundation/Foundation.h>
#import "Forecast.h"

NS_ASSUME_NONNULL_BEGIN

// Create a completion block that returns a forecast and an error
typedef void (^CompletionBlock)(Forecast *forecast, NSError *error);

@interface ALWModelController : NSObject
    
@property (nonatomic, readonly) NSArray *forecasts;
    
- (void)searchForecastWithZip:(NSString *)zipCode withCompletionBlock:(CompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
