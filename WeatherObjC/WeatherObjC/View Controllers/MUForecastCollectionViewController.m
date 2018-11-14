//
//  MUForecastCollectionViewController.m
//  WeatherObjC
//
//  Created by Moin Uddin on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "MUForecastCollectionViewController.h"
#import "MUForecastCollectionViewCell.h"
#import "../Models/MUForecast.h"
#import "../Model Controllers/MUForecastController.h"
@interface MUForecastCollectionViewController ()

@end

@implementation MUForecastCollectionViewController

static NSString * const reuseIdentifier = @"ForecastCell";

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _forecastController = [[MUForecastController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _forecastController = [[MUForecastController alloc] init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [[self searchBar] setDelegate:self];
    [[self collectionView] setDataSource:self];
    //self.collectionView.dataSource = self;
    //self.collectionView.delegate = self;
    //self.collectionView.delegate = self;
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = [searchBar text];
    if(!searchTerm) { return; }
    
    [self.forecastController searchForWeatherWithCity:searchTerm completion:^(NSArray *forecasts, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self collectionView] reloadData];
        });
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[self.forecastController forecasts] count];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
        MUForecastCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ForecastCell" forIndexPath:indexPath];
    
        MUForecast *forecast = [[self.forecastController forecasts] objectAtIndex:[indexPath row]];
        NSString *temp = [[forecast temperature] stringValue];
        [[cell forecastImageView ] setImage: [forecast image]];
        [[cell forecastLabel] setText: temp];
        return cell;
}

@end
