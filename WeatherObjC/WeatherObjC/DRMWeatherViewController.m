//
//  DRMWeatherViewController.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "DRMWeatherViewController.h"

@interface DRMWeatherViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property DRMForcastController *forecastController;

@end

@implementation DRMWeatherViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self != nil) {
        [self setForecastController: [[DRMForcastController alloc] init]];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self != nil) {
        [self setForecastController: [[DRMForcastController alloc] init]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _forecastController.forecasts.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    DRMWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath: indexPath];
    DRMDailyForecast *forecast = [_forecastController.forecasts objectAtIndex: indexPath.row];
    
    [cell setForecast: forecast];
    
    return cell;
}

#pragma mark <UISearchBarDelegate>
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_forecastController fetchForecastForZipcode: searchBar.text withCompletion:^(NSError *error) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];
}


@end
