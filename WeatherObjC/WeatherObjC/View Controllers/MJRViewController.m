//
//  MJRViewController.m
//  WeatherObjC
//
//  Created by Moses Robinson on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "MJRViewController.h"
#import "MJRWeatherCollectionViewCell.h"
#import "MJRWeatherController.h"
#import "MJRWeather.h"

@interface MJRViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MJRViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        _weatherController = [[MJRWeatherController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.weatherController searchForWeatherWithZipcode:searchBar.text completion:^(NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self collectionView] reloadData];
        });
        
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.weatherController forecasts] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MJRWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    MJRWeather *weather = [self.weatherController forecasts][indexPath.row];
    
    cell.weather = weather;
    [cell updateViews];
    
    return cell;
}

@end
