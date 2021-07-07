//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "IIIForecastController.h"
#import "IIIWeatherCollectionViewCell.h"
#import "IIIDailyForecast.h"

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation IIIWeatherViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _forecastController = [[IIIForecastController alloc] init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.searchBar.delegate = self;
    _cityNameLabel.text = @"City name";
    // Do any additional setup after loading the view.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    int zip = [searchBar.text intValue];
    [_forecastController fetchForecastsForZip:zip completitionBlock:^(NSArray * forecasts, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            self->_collectionView.reloadData;
            self->_cityNameLabel.text = [forecasts[0] cityName];
        });
    }];
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    IIIWeatherCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    IIIDailyForecast *forecast = _forecastController.forecasts[indexPath.item];
    cell.weatherImageView.image = forecast.icon;
    double tempInC = forecast.temperature - 273.0;
    cell.weatherLabel.text = [NSString stringWithFormat:@"%.2f degree C", tempInC];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _forecastController.forecasts.count;
}


@end
