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

@property NSArray *forecasts;

@end

@implementation IIIWeatherViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[IIIForecastController alloc] init];
        _forecasts = [[NSArray alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _controller = [[IIIForecastController alloc] init];
        _forecasts = [[NSArray alloc] init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.searchBar setDelegate:self];
    [self.collectionView setDataSource:self];
}

// MARK: - Collection View

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.forecasts.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    IIIForecast *forecast = [self.controller.forecasts objectAtIndex:indexPath.item];
    cell.forecast = forecast;
    
    return cell;
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.controller searchCityWithZipCode:searchBar.text completion:^(NSArray * _Nonnull forecasts, NSError * _Nonnull error) {
        
        if (error) {
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



@end
