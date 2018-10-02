//
//  SearchWeatherViewController.m
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "SearchWeatherViewController.h"
#import "WeatherCollectionViewCell.h"

@interface SearchWeatherViewController ()

@end

@implementation SearchWeatherViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        _weatherController = [[WeatherController alloc] init];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if(self)
    {
        _weatherController = [[WeatherController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar.delegate = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.weatherController searchForWeatherWithZipCode: searchBar.text appID: _weatherController.apiId completion:^(NSArray *forecasts, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.collectionView reloadData];
        });
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return _weatherController.forecasts.count;
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherCollectionViewCell *cell = (WeatherCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    
    cell.weatherImageView.image = [UIImage imageNamed:@"01d"];
    cell.temperatureLabel.text  = @"100";
    return cell;
}



@end
