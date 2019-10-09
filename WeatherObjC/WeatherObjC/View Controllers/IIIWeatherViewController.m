//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "IIIWeatherCollectionViewCell.h"
#import "IIIWeatherController.h"

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
        _weatherController = [[IIIWeatherController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityNameLabel.text = nil;
    self.searchBar.delegate = self;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.searchBar becomeFirstResponder];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ForecastCell" forIndexPath:indexPath];
    IIIForecast *forecast = _weatherController.forecasts[indexPath.item];
    cell.forecast = forecast;
    [cell updateViews];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[_weatherController forecasts] count];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *zipCodeSearchQuery = self.searchBar.text;
    [_weatherController searchWeatherWithZipcode:zipCodeSearchQuery completion:^(NSString *cityName, NSError *error) {
        if (error) {
            NSLog(@"Error fetching weather data with zip code: %@", error);
            return;
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            self.cityNameLabel.text = cityName;
            [[self collectionView] reloadData];
            [self.searchBar resignFirstResponder];
        });
    }];
}

@end
