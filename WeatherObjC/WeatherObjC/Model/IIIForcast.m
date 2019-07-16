//
//  IIIForcast.m
//  WeatherObjC
//
//  Created by Michael Flowers on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForcast.h"

@implementation IIIForcast
//1. call the initializer

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    
    if (self){
        //we are inside the json and we want to grab the city's name
        //this dictionary is the outter level, or wrapper dictionary...the first {
        _city = dictionary[@"city"][@"name"]; //look for a key named city, inside of that key look for a value called "name".
        
        //List is top level. Its value is an Array of Dictionaries. Temp and Weather are keys that hold values of the properties we want to use.
        
        //drill into the array and subsequently drill down into the dictionary to abstract the values we want.
        
            //1. first attempt: my theory is that every [@""] is drilling down or it = {
            //Dictionary(first { ) inside this there is another dictionary with a Key named "list" (second { ) -> inside the list dictionary there is another dictionary with the key named "temp" (third { ), and finally inside of that temp dictionary there is a key that matches the value we want called max. We set that value to our temperature property.
            //2. if the value is a primative data type, i.e. double, then we put the dictionary in a [] primative type ];
        _temperature = [dictionary[@"list"][@"temp"][@"max"] doubleValue];
        _image = dictionary[@"list"][@"weather"][@"icon"];
        
    }
    return self;
}

- (instancetype)initWithCity:(NSString *)city temperature:(double)temperature image:(NSString *)image{
    self = [super init];
    
    if (self){
        _city = city;
        _temperature = temperature;
        _image = image;
    }
    return self;
}
@end
