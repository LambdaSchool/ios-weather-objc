//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "HHWeatherViewController.h"
#import "HHWeatherController.h"
#import "HHWeather.h"
#import "HHWeatherCollectionViewCell.h"

@interface HHWeatherViewController ()

@end

@implementation HHWeatherViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _weatherController = [[HHWeatherController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _weatherController = [[HHWeatherController alloc] init];
        _forecasts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *text = searchBar.text;
    if (text.length == 0) { return; }
    
    [self.weatherController fetchWeatherForCity:searchBar.text completionBlock:^(NSArray * forecasts, NSError * error) {
        [self.forecasts setArray:forecasts];
        dispatch_async(dispatch_get_main_queue(), ^ {
            [self.collectionView reloadData];
        });
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HHWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    HHWeather *weather = [self.forecasts objectAtIndex:indexPath.row];
    NSString *temperature = [NSString stringWithFormat:@"%@ : %@", weather.name, weather.temperature];
    
    cell.temperatureLabel.text = temperature;
    cell.weatherImageView.image = weather.image;
    
    return cell;
}

@end
