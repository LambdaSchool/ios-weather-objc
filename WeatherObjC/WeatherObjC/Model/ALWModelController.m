//
//  ALWModelController.m
//  

#import "ALWModelController.h"

@interface ALWModelController()

@property NSString *baseURLString;
@property NSString *apiKey;

@end

@implementation ALWModelController

    - (instancetype)init {
        self = [super init];
        if (self != nil) {
            _forecasts = [NSArray arrayWithObjects: nil];
            _baseURLString = @"api.openweathermap.org/data/2.5/forecast/daily";
            _apiKey = @"b183d7ec4c0c9dcc5178324816716c88";
        }
        return self;
    }
    
- (void)searchForecastWithZip:(NSString *)zipCode withCompletionBlock:(CompletionBlock)completionBlock {
    
    // Establish base url for our search w/ the convenience method
    NSURL *baseURL = [NSURL URLWithString:_baseURLString];
    
    // Decompose into its components
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    // Add query items
    
    // zip
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    
    // api key
    NSURLQueryItem *searchItemAPIKey = [NSURLQueryItem queryItemWithName:@"appid" value:_apiKey];
    
    [components setQueryItems:@[searchItem, searchItemAPIKey]];

    // Create url with components
    NSURL *url = [components URL];
     
     // URL Request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // Create a data task
    [NSURLSession sharedSession];
}

@end


//class SWAPI {
//
//    static let endpoint = "https://swapi.co/api/people/"
//
//    static func searchForPeople(with searchTerm: String, completion: @escaping ([Person]?, Error?) -> Void) {
//
//        // Establish the base url for our search
//        guard let baseURL = URL(string: SWAPI.endpoint) // or just `endpoint`
//        // if it fails for any reason, we will get a fatal error
//        else {
//            fatalError("Unable to construct baseURL")
//        }
//
//        // Decompose it into its components
//        // Construct a search from the constituent parts
//        // Decompose, customize, recompose = REUSE THIS ALL THE TIME, whenever you use sebservices/networking. The first thing if you are going to construct a restful search, decompose to the componants, add any kind o fquery things into it, then recompose it
//        guard var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
//            fatalError("Unable to resolve baseURL to components")
//        }
//
//        // Create the query item using `search` and the search term
//        // the URL query item eliminates having to do it by hand: "https://swapi.co/api/people/?search=le"
//        // This automatically does all escaping, so it works with web API coding
//        // It also adds the equal signs
//        // It knows it's a key word and the thing that goes with the key word with an equal sign
//        let searchQueryItem = URLQueryItem(name: "search", value: searchTerm)
//
//        // Add in the search term
//        // You may have more than one, so that's why you just add it to an array
//        urlComponents.queryItems = [searchQueryItem]
//
//        // Recompose all those individual components back into a fully
//        // realized search URL
//        guard let searchURL = urlComponents.url else {
//            NSLog("Error constructing search URL for \(searchTerm)")
//            // completion is the last thing we do before ending our search
//            completion(nil, NSError()) // you could use a fatal error instead
//            return
//        }
//        // ^^ created search URL, but haven't done anything with it yet
//
//
//
//
//        // Create a GET request
//        // All reusable code, just modify little things
//        var request = URLRequest(url: searchURL)
//        request.httpMethod = "GET" // "Please fetch information for me", simplest REST thing you can do, equivalent to "read"
//
//        // Asynchronously fetch data
//        // Once the fetch completes, it calls its handler either with data
//        // (if available) _or_ with an error (if one happened)
//        // There's also a URL Response but we're going to ignore it
//        // Create a data task that is a URLSession, it's a singleton because it has the class name followed by `shared`, and we set a dataTask with our request - this basically runs our URL and fetches our data
//        let dataTask = URLSession.shared.dataTask(with: request) {
//
//            // We have a completion handler and we get: data, a response, and an error
//            // This closure is sent three parameters:
//            data, _, error in
//
//            // Rehydrate our data by unwrapping it
//            // We are not going forward unless we have data, and unless we have no error
//            // if error is not nil, go into the guard, if we don't have data, go into the guard
//            guard error == nil, let data = data else {
//                // unwrap the error using conditional binding(if let)
//                if let error = error { // this will always succeed
//                    NSLog("Error fetching data: \(error)")
//                    completion(nil, error) // we know that error is non-nil
//                }
//                return
//            }
//
//            // We know now we have no error *and* we have data to work with
//
//            // Convert the data to JSON
//            // We need to convert snake_case decoding to camelCase
//            // Oddly there is no kebab-case equivalent
//            // Note issues with naming and show similar thing
//            // For example: https://github.com/erica/AssetCatalog/blob/master/AssetCatalog%2BImageSet.swift#L295 // how do you deal with kebab case
//            // See https://randomuser.me for future, good examples of JSON in use
//            do {
//                // Declare, customize, use the decoder
//                // Must do this before we can use it
//                let jsonDecoder = JSONDecoder()
//                // customize - it is converting from snake case to camelCase because it's the default
//                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//
//                // Perform decoding into [Person] stored in PersonSearchResults
//                // Get the data that was sent us that we unwrapped, decoding it into PersonSearchResults
//                let searchResults = try jsonDecoder.decode(PersonSearchResults.self, from: data)
//                let people = searchResults.results
//
//                // Send back the results to the completion handler
//                completion(people, nil)
//
//                // if it does not work, catch it with an error
//            } catch {
//                NSLog("Unable to decode data into people: \(error)")
//                completion(nil, error)
//                //        return
//            }
//        }
//
//        // A data task needs to be run. To start it, you call `resume`.
//        // "Newly-initialized tasks begin in a suspended state, so you need to call this method to start the task."
//        dataTask.resume()
//    }
//}
