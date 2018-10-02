//
//  WeatherCollectionViewController.m
//  WeatherObjC
//
//  Created by Linh Bouniol on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "WeatherCollectionViewController.h"
#import "ForecastController.h"
#import "Forecast.h"
#import "ForecastCollectionViewCell.h"

@interface WeatherCollectionViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation WeatherCollectionViewController

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _forecastController = [[ForecastController alloc] init];
    }
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _forecastController = [[ForecastController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchBar.delegate = self;
    _collectionView.dataSource = self;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _forecastController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ForecastCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ForecastCell" forIndexPath:indexPath];
    
    Forecast *forecast = [_forecastController.forecasts objectAtIndex:indexPath.row];
    cell.cityLabel.text = forecast.name;
    
    double tempInFahrenheit = (forecast.temperature - 273.)*9./5. + 32.; // . is the same as .0
    
    // "f" is floating point (double) %@ is an object, %d is int/bool
    // "%.0f" means you want zero digits after the decimal. ºF
    cell.temperatureLabel.text = [NSString stringWithFormat:@"%.0fºF", tempInFahrenheit];
    
    cell.forecastImageView.image = [UIImage imageNamed:forecast.imageName];
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_forecastController loadForecastsForZipcode:searchBar.text completion:^(NSArray * _Nonnull forecasts, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"Error searching: %@", error);
        }
        
        [self.collectionView reloadData];
    }];
}

@end
