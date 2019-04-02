//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "IIIForecast.h"
#import "IIIForecastController.h"
#import "IIIWeatherCollectionViewCell.h"

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

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _forecastController = [[IIIForecastController alloc] init];
    }
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.collectionView.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    int zipcode = [searchBar.text intValue];
    
    if (zipcode) {
        [self.forecastController fetchForecastsForZipCode:zipcode completion:^(NSError * _Nonnull error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
               // NSLog(@"Zipcode is: %d", zipcode);
            });
        }];
        
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.forecastController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    IIIWeatherCollectionViewCell *weatherCell = (IIIWeatherCollectionViewCell *)cell;
    
    weatherCell.forecast = self.forecastController.forecasts[indexPath.row];
    
    [weatherCell updateViews];
    
    return cell;
}

@end
