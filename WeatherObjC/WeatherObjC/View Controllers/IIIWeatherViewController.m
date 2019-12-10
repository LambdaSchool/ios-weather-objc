//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "IIIWeatherCollectionViewCell.h"
#import "JLRDailyForecast.h"
#import "JLRDailyForecastController.h"

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSArray *forecasts;

@end

@implementation IIIWeatherViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[JLRDailyForecastController alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self.collectionView setDataSource:self];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.controller
     searchForForecastWithZipCode:searchBar.text completion:^(NSArray * _Nonnull forecasts, NSError * _Nonnull error) {
        if (error)
        {
            NSLog(@"Error: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.forecasts = forecasts;
            [self.collectionView reloadData];
        });
        NSLog(@"Search result: %@", forecasts);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    JLRDailyForecast *forecast = self.forecasts[indexPath.row];
    
    cell.forecast = forecast;
    [cell updateViews];
    
    return cell;
}


@end
