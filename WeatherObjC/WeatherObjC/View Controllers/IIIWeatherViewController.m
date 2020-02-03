//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "VVSWeatherController.h"
#import "IIIWeatherCollectionViewCell.h"
#import "VVSWeather.h"
#import "VVSTemp.h"

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property VVSWeatherController *controller;
@property VVSWeather *weather;

@end

@implementation IIIWeatherViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    _controller = [[VVSWeatherController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self.collectionView setDataSource:self];
    self.cityNameLabel.text = @"Check the weather in your area";
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSNumberFormatter *zipCodeNumber = [[NSNumberFormatter alloc] init];
    zipCodeNumber.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *zipCode = [zipCodeNumber numberFromString:searchBar.text];
    
    [self.controller searchForCityWithZipCode: zipCode completion:^(VVSWeather *weather, NSError *error) {
        if(error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // set the weather
            self.weather = weather;
            // update the UI
            self.cityNameLabel.text = self.weather.name;
            [self.collectionView reloadData];
        });
        NSLog(@"Search result: %@", weather);
    }];
}

- (NSString *)tempString:(NSNumber *)temp
{
    // roundingup the temperature
    int intTemp = (int)ceil([temp doubleValue]);
    NSString *stringTemp = [NSString stringWithFormat: @"%i", intTemp];
    return stringTemp;
}

// MARK: UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.weather.temps.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    VVSTemp *temp = self.weather.temps[indexPath.item];
    
    cell.weatherImageView.image = [UIImage imageNamed:temp.icon];
    
    NSString *fTemp = [self tempString:temp.temp];
    cell.temperatureLabel.text = [NSString stringWithFormat:@"%@℉", fTemp];
    
    
    return cell;
    
}
@end
