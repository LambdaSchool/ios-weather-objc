//
//  ForecastViewController.m
//  WeatherObjC
//
//  Created by Benjamin Hakes on 2/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "ForecastViewController.h"
#import "ForecastCollectionViewCell.h"
#import "Forecast.h"
#import "ModelController.h"

@interface ForecastViewController ()

@property ModelController *modelController;

@end

@implementation ForecastViewController

static NSString * const reuseIdentifier = @"ForcastCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_forecastCollectionView setDataSource:self];
    [_searchBarAndSearchDisplayController setDelegate:self];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        _modelController = [[ModelController alloc] initWithArray:array];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
     self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        _modelController = [[ModelController alloc] initWithArray:array];
    }
    
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ForecastCollectionViewCell *cell = (ForecastCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    Forecast *forecast = [_modelController.forecasts objectAtIndex: indexPath.row];
    
    cell.forecastImageVIew.image = forecast.image;
    
    NSString *labelText = [NSString stringWithFormat:@"%@ / %@", forecast.cityName, forecast.temperature];
    cell.forecastLabel.text = labelText;
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_modelController.forecasts count];
}


- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_modelController searchForecastForZip:[searchBar text] withBlock:^(Forecast  * _Nonnull forecast ,NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self forecastCollectionView] reloadData];
        });
        
    }];
}
@end
