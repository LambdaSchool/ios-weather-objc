//
//  ALWViewController.m
//  WeatherObjC
//
//  Created by Audrey Welch on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "ALWViewController.h"
#import "ALWForecast.h"
#import "ALWCollectionViewCell.h"

@interface ALWViewController ()

@end

@implementation ALWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self searchBar] setDelegate:self];
    //[[self collectionView] dataSource:self];
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        _modelController = [[ALWModelController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self != nil) {
        _modelController = [[ALWModelController alloc] init];
    }
    return self;
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSString *text = searchBar.text;
    if (text.length == 0) { return; }
    
    [self.modelController searchForForecastWithZipCode:searchBar.text completion:^(NSArray * _Nonnull forecasts, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _modelController.forecasts = forecasts;
            //[self setForecasts:forecasts];
            [[self collectionView] reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.modelController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Cast as a ColelctionViewCell
    ALWCollectionViewCell *cell = (ALWCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    ALWForecast *forecast = [self.modelController.forecasts objectAtIndex:indexPath.row];
    [[cell cityLabel] setText:[forecast name]];
    [[cell imageView] setImage: [UIImage imageNamed:[forecast icon]]];
    //[[cell temperatureLabel] setText:[forecast temp]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
