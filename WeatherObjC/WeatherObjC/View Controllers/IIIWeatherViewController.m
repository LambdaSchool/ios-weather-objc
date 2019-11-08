//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "IIIWeatherCollectionViewCell.h"
#import "IIIForecastFetcher.h"
#import "IIIForecast.h"

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;

@property IIIForecastFetcher *forecastFetcher;

@end

@implementation IIIWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.searchBar setDelegate:self];
    [self.collectionView setDataSource:self];
    
    _forecastFetcher = [[IIIForecastFetcher alloc] init];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[self.forecastFetcher forecasts] count];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    // Configure the cell
    IIIForecast *forecast = [[self.forecastFetcher forecasts] objectAtIndex:[indexPath row]];
    [[cell weatherImageView] setImage:[forecast image]];
    [[cell temperatureLabel] setText:[NSString stringWithFormat:@"%f", forecast.temp]];
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = searchBar.text;
    [_forecastFetcher fetchForecasts:searchTerm completionHandler:^(NSArray *forecasts, NSError *error) {
        [self.collectionView reloadData];
    }];
}

@end
