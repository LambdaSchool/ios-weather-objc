//
//  WeatherViewController.m
//  WeatherObjC
//
//  Created by Conner on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "WeatherViewController.h"
#import "CGAForecastController.h"

@interface WeatherViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self searchBar] setDelegate:self];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _forecastController = [[CGAForecastController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _forecastController = [[CGAForecastController alloc] init];
    }
    return self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [[self forecastController] searchForForecastWithZipcode:[searchBar text] completion:^(NSMutableArray *forecastsFromZipcode, NSError *error) {
        NSLog(@"%@", forecastsFromZipcode);
    }];
}

@end
