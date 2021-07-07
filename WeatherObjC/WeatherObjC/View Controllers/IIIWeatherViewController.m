//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "IIIWeatherCollectionViewCell.h"

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation IIIWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar.delegate = self;
    _collectionView.dataSource = self;
    [[self cityNameLabel] setText:@""];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        _forecastController = [[IIIDailyForecastController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        _forecastController = [[IIIDailyForecastController alloc] init];
    }
    return self;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[[self forecastController] forecasts] count];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"WeatherCell" forIndexPath: indexPath];
    IIIDailyForecast *forecast = [[[self forecastController] forecasts] objectAtIndex: [indexPath row]];
    float temperature = [forecast temperature];
    
    cell.weatherIconImageView.image = [forecast icon];
    cell.temperatureCityTextLabel.text = [[NSNumber numberWithFloat: temperature] stringValue];
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchCode = [searchBar text];
    
    [[self forecastController] fetchForecastsWithZipCode: searchCode completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching forecasts: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self collectionView] reloadData];
        });
        
    }];
}

@end
