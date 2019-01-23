//
//  ViewController.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "ViewController.h"
#import "NKTWeatherCVC.h"
#import "NKTWeatherController.h"

@interface ViewController ()

@end

@implementation ViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        _weatherController = [[NKTWeatherController alloc] init];
    }
    return self;
}


-(instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if(self)
    {
        _weatherController = [[NKTWeatherController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.collectionView.dataSource = self;

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _weatherController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NKTWeatherCVC *cell = (NKTWeatherCVC *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.weather = self.weatherController.forecasts[indexPath.row];
    [cell updateViews];
    return cell;
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    int zipCode = [searchBar.text intValue];
    
    if (zipCode != nil)
    {   
        [self.weatherController searchForWeatherForZipCode:zipCode completion:^(NSError * _Nonnull error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.collectionView reloadData];
            });
        }];
    }
}




@end
