//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLCWeatherViewController.h"
#import "JLCWeatherController.h"
#import "JLCWeatherCollectionViewCell.h"
#import "JLCOneDayForcast.h"


@interface JLCWeatherViewController ()

#pragma mark - IBOutlets and Properties

@end

@implementation JLCWeatherViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _weatherController = [[JLCWeatherController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _weatherController = [[JLCWeatherController alloc] init];
    }
    return self;
}

#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.weatherController searchForWeatherByCity:searchBar.text completion:^(NSArray *forcasts, NSError *error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.forcasts = forcasts;
            
            [self.collectionView reloadData];
        });
    }];
}

#pragma mark - Collection View Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.weatherController.forcasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JLCWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    JLCOneDayForcast *forcast = [self.weatherController.forcasts objectAtIndex:indexPath.item];
    
    self.cityNameLabel.text = forcast.cityName;
    cell.forcast = forcast;
    NSString *imageName = forcast.icon;
    UIImage *image = [UIImage imageNamed:imageName];
    cell.imageView.image = image;
    cell.tempLabel.text = [NSString stringWithFormat:@"%.f°F with %@", forcast.temp, forcast.weatherDescription];
    
    return cell;
}


@end
