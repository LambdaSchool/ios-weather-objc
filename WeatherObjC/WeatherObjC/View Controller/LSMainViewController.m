//
//  LSMainViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 11/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSMainViewController.h"
#import "LSWeatherController.h"
#import "LSWeatherCollectionViewCell.h"
#import "LSWeather.h"

@interface LSMainViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation LSMainViewController

#pragma mark Initializer

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _weatherController = [[LSWeatherController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _weatherController = [[LSWeatherController alloc] init];
    }
    return self;
}

#pragma mark LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar.delegate = self;
    _collectionView.dataSource = self;
    
}

#pragma mark Collection View Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _weatherController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LSWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    LSWeather *weather = [[_weatherController forecasts] objectAtIndex:indexPath.row];
    cell.weatherImageView.image = weather.forecastIcon;
    
    double fahrenheitTemp = (weather.temperature - 273.15)* 9.0/5.0 + 32.0;
    cell.temperatureLabel.text = [NSString stringWithFormat:@"%.0f", fahrenheitTemp];
    
    return cell;
}

#pragma mark Search Bar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_weatherController searchWeatherWithZip:searchBar.text completion:^(NSArray * forecasts, NSError * error) {
        if (error) {
            NSLog(@"Error searching for zip %@", error);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.weatherController.forecasts = forecasts;
            [[self collectionView] reloadData];
        });
    }];
}

@end
