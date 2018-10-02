//
//  STDWeatherViewController.m
//  WeatherObjC
//
//  Created by De MicheliStefano on 02.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "STDWeatherViewController.h"
#import "STDWeatherCollectionViewCell.h"
#import "STDWeatherController.h"

@interface STDWeatherViewController ()

@end

@implementation STDWeatherViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        _weatherController = [[STDWeatherController alloc] initWithArray:array];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        _weatherController = [[STDWeatherController alloc] initWithArray:array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_collectionView setDataSource:self];
    [_searchBar setDelegate:self];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_weatherController.forecasts count];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    STDWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    STDWeather *forecast = [[_weatherController forecasts] objectAtIndex:indexPath.row];
    cell.forecast = forecast;
    [cell updateViews];
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_weatherController getWeatherDataForZipCode:[searchBar text] completion:^(NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self collectionView] reloadData];
        });
        
    }];
}

@end
