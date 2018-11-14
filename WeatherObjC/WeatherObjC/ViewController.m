//
//  ViewController.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "ViewController.h"
#import "DailyForecastController.h"
#import "WeatherCollectionViewCell.h"
#import "DailyForecast.h"

@interface ViewController ()

@property DailyForecastController *dailyForecastController;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _dailyForecastController = [[DailyForecastController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _dailyForecastController = [[DailyForecastController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.searchBar setDelegate:self];
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dailyForecastController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    DailyForecast *dailyForecast = [self.dailyForecastController.forecasts objectAtIndex:[indexPath row]];
    
    NSString *dayString = [NSString stringWithFormat: @"%ld", [indexPath row]];
    [cell.dayLabel setText:dayString];
    [cell.imageView setImage:dailyForecast.forecastImage];
    [cell.lowTemperatureLabel setText:[dailyForecast.lowTemperature stringValue]];
    [cell.highTemperatureLabel setText:[dailyForecast.highTemperature stringValue]];
    
    return cell;
}

#pragma mark <SearchBar>

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *zipcode = searchBar.text;
    
    [_dailyForecastController getDailyForecastsFor:zipcode completion:^(NSArray * _Nullable forecasts, NSError * _Nullable error) {
        [self.dailyForecastController setForecasts:forecasts];
        
        DailyForecast *firstForecast = [self.dailyForecastController.forecasts firstObject];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.cityLabel setText:firstForecast.city];
            
            [self.collectionView reloadData];
        });
    }];
}

static NSString * const reuseIdentifier = @"DailyForecastCell";

@end
