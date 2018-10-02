//
//  WeatherViewController.m
//  WeatherObjC
//
//  Created by Conner on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherCollectionViewCell.h"
#import "CGAForecast.h"
#import "CGAForecastController.h"

@interface WeatherViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self searchBar] setDelegate:self];
    [[self collectionView] setDataSource:self];
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
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self collectionView] reloadData];
        });
    }];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    NSArray *forecasts = [[self forecastController] forecasts];
    int temperature = [[[forecasts objectAtIndex:[indexPath row]] temperature] intValue];
    [[cell weatherImageIcon] setImage:[[forecasts objectAtIndex:[indexPath row]] forecastIcon]];
    [[cell weatherCityLabel] setText:[[forecasts objectAtIndex:[indexPath row]] cityName]];
    [[cell weatherTempLabel] setText:[NSString stringWithFormat:@"%iF", temperature]];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[[self forecastController] forecasts] count];
}

@end
