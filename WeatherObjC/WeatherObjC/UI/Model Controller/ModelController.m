//
//  ModelController.m
//  WeatherObjC
//
//  Created by Benjamin Hakes on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "ModelController.h"

@interface ModelController()

@property NSString *baseURLString;
@property NSString *apiKey;


@end

@implementation ModelController

- (instancetype)init{
    self = [super init];
    if (self) {
        _forecasts = [[NSArray alloc] init];
        _baseURLString = @"https://openweathermap.org/data/2.5/forecast/daily";
        _apiKey = @"f6ae4d490fc63a60a03cd46fc1250229";
        
    }
    return self;
}

-(void)searchForecastForZip: (NSString *)zipCode, withBlock: ^(Forecast *forecast, NSError *error) {

   
    NSURL *baseURL = [NSURL URLWithString:_baseURLString];
        
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL: baseURL resolvingAgainstBaseURL: YES];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *queryItem2 = [NSURLQueryItem queryItemWithName:@"appid" value:_apiKey];
    
    NSArray<NSURLQueryItem *> *queryItems = @[queryItem, queryItem2];
    
    urlComponents.queryItems = queryItems;
    
    NSURL *searchURL = [urlComponents URL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL: searchURL];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
          
          NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
          NSLog(@"Data received: %@", myString);
      }] resume];
    
    
}

//static func searchForPeople(with searchTerm: String, completion: @escaping ([Person]?, Error?) -> Void) {
//
//    // Establish the base url for our search
//    guard let baseURL = URL(string: "https://swapi.co/api/people/")
//    else {
//        fatalError("Unable to construct baseURL")
//    }
//
//    // Decompose it into its components
//    guard var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
//        fatalError("Unable to resolve baseURL to components")
//    }
//
//    // Create the query item using `search` and the search term
//    let searchQueryItem = URLQueryItem(name: "search", value: searchTerm)
//
//    // Add in the search term
//    urlComponents.queryItems = [searchQueryItem]
//
//    // Recompose all those individual components back into a fully
//    // realized search URL
//    guard let searchURL = urlComponents.url else {
//        NSLog("Error constructing search URL for \(searchTerm)")
//        completion(nil, NSError())
//        return
//    }
//
//    // Create a GET request
//    var request = URLRequest(url: searchURL)
//    request.httpMethod = "GET" // basically "READ"
//
//    // Asynchronously fetch data
//    // Once the fetch completes, it calls its handler either with data
//    // (if available) _or_ with an error (if one happened)
//    // There's also a URL Response but we're going to ignore it
//    let dataTask = URLSession.shared.dataTask(with: request) {
//        // This closure is sent three parameters:
//        data, _, error in
//
//        // Rehydrate our data by unwrapping it
//        guard error == nil, let data = data else {
//            if let error = error { // this will always succeed
//                NSLog("Error fetching data: \(error)")
//                completion(nil, error) // we know that error is non-nil
//            }
//            return
//        }
//
//        // We know now we have no error *and* we have data to work with
//
//        // Convert the data to JSON
//        // We need to convert snake_case decoding to camelCase
//        // Oddly there is no kebab-case equivalent
//        // Note issues with naming and show similar thing
//        // For example: https://github.com/erica/AssetCatalog/blob/master/AssetCatalog%2BImageSet.swift#L295
//        // See https://randomuser.me for future
//        do {
//            // Declare, customize, use the decoder
//            let jsonDecoder = JSONDecoder()
//            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//
//            // Perform decoding into [Person] stored in PersonSearchResults
//            let searchResults = try jsonDecoder.decode(PersonSearchResults.self, from: data)
//            let people = searchResults.results
//
//            // Send back the results to the completion handler
//            completion(people, nil)
//
//        } catch {
//            NSLog("Unable to decode data into people: \(error)")
//            completion(nil, error)
//            //        return
//        }
//    }
//
//    // A data task needs to be run. To start it, you call `resume`.
//    // "Newly-initialized tasks begin in a suspended state, so you need to call this method to start the task."
//    dataTask.resume()
//}



@end
