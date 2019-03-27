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

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        _weatherController = [[NELWeatherController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    
    if (self) {
        
        _weatherController = [[NELWeatherController alloc] init];
    
        _forecasts = [[NSMutableArray alloc] init];
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    self.collectionView.dataSource = self;
   
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *text = searchBar.text;
    if (text.length == 0) { return; }
    
    [self.weatherController getWeatherForCity: searchBar.text completion:^(NSArray *forecasts, NSError *error) {
        [self.forecasts setArray:forecasts];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NELWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"weatherCell" forIndexPath:indexPath];
    
    NELWeather *weather = [self.forecasts objectAtIndex:indexPath.row];
    NSString *temperature = [NSString stringWithFormat: @"%@ - @%@", weather.cityName, weather.temperature];
    cell.weatherLabel.text = temperature;
    cell.imageView.image = weather.image;
   
    return cell;
}


@end
