//
//  LMSWeatherForecastViewController.m
//  WeatherObjC
//
//  Created by Lisa Sampson on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "LMSWeatherForecastViewController.h"
#import "LMSWeatherForecastCollectionViewCell.h"
#import "LMSForecastController.h"

@interface LMSWeatherForecastViewController ()

@end

@implementation LMSWeatherForecastViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self != nil) {
        _forecastController = [[LMSForecastController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        _forecastController = [[LMSForecastController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.zipcodeSearchBar.delegate = self;
    self.weatherCollectionView.dataSource = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_forecastController fetchForecastForZipcode: searchBar.text withCompletion:^(NSError *error) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.weatherCollectionView reloadData];
        }];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.forecastController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LMSWeatherForecastCollectionViewCell *cell = (LMSWeatherForecastCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    cell.forecast = self.forecastController.forecasts[indexPath.row];
    
    [cell updateViews];
    
    return cell;
}

@end
