//
//  ViewController.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "ViewController.h"
#import "OSIWeatherController.h"
#import "OSIWeather.h"
#import "OSIWeatherCollectionViewCell.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property OSIWeatherController *osiWeatherController;

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
   _osiWeatherController = [[OSIWeatherController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        _osiWeatherController = [[OSIWeatherController alloc] init];
    }
    return self;
}



static NSString * const reuseIdentifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[_osiWeatherController weatherForWeek] count];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    OSIWeatherCollectionViewCell *cell = (OSIWeatherCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    OSIWeather *weather = [_osiWeatherController.weatherForWeek objectAtIndex: indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:weather.imageName];
    cell.tempLabel.text = [NSString stringWithFormat:@"%f", weather.temperature];
    NSString *labelText = weather.name;
    cell.titleLabel.text = labelText;
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
   //  if (self.searchBar.text != nil) {
        
    [searchBar resignFirstResponder];
    [self.osiWeatherController searchWeatherUsingZipCode: searchBar.text withBlock:^(OSIWeather *weather, NSError *error) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [[self collectionView] reloadData];
        
        }];
    }];
    }
// }
@end
