//
//  NELWeatherViewController.m
//  WeatherObjC
//
//  Created by Nelson Gonzalez on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "NELWeatherViewController.h"
#import "NELWeatherController.h"
#import "NELWeather.h"
#import "NELWeatherCollectionViewCell.h"

@interface NELWeatherViewController ()


@end

@implementation NELWeatherViewController


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    
    if (self) {
        
        _weatherController = [[NELWeatherController alloc] init];
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.weatherController getWeatherForCity: searchBar.text completion:^(NSArray *forecasts, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _weatherController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NELWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"weatherCell" forIndexPath:indexPath];
    
    NELWeather *weather = [_weatherController.forecasts objectAtIndex:indexPath.row];
    NSString *temperature = [NSString stringWithFormat: @"%@ - %@", weather.cityName, weather.temperature];
    cell.weatherLabel.text = temperature;
    cell.imageView.image = weather.image;
   
    return cell;
}


@end
