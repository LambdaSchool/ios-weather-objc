//
//  ALWModelController.m
//  

#import "ALWModelController.h"

@implementation ALWModelController

    - (instancetype)init {
        self = [super init];
        if (self != nil) {
            _forecasts = [NSArray arrayWithObjects: nil];
        }
        return self;
    }

@end
