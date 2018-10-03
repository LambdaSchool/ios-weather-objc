//
//  SearchWeatherViewController.m
//  WeatherObjC
//
//  Created by Carolyn Lea on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "SearchWeatherViewController.h"
#import "WeatherCollectionViewCell.h"
#import "WeatherController.h"

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
    self.collectionView.dataSource = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    int zipCode = [searchBar.text intValue];
    
    if (zipCode)
    {
        [self.weatherController searchForWeatherWithZipCode:zipCode completion:^(NSError * _Nonnull error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.collectionView reloadData];
            });
        }];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _weatherController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherCollectionViewCell *cell = (WeatherCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    cell.weather = self.weatherController.forecasts[indexPath.row];
    [cell updateViews];
    return cell;
}



@end
