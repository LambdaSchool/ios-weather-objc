//
//  ViewController.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "ViewController.h"
#import "DailyForecast.h"
#import "DailyForecastController.h"
#import "WeatherCollectionViewCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ViewController

//In the view controller's initializers ( initWithCoder and initWithNibName ), initialize the model controller property.
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _dailyForecastController = [[DailyForecastController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _dailyForecastController = [[DailyForecastController alloc] init];
    }
    return self;
}

// In the viewDidLoad set the view controller as the delegate of the search bar and the dataSource of the collection view.
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _searchBar.delegate = self;
    _collectionView.dataSource = self;
    double width = view.frame.size.width / 3;
    UICollectionViewFlowLayout layout = _collectionView.collectionViewLayout;
}

// Collection View Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dailyForecastController.dailyForecasts.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    DailyForecast *dailyForecast = [[_dailyForecastController dailyForecasts] objectAtIndex:indexPath.row];
    cell.weatherImage.image = dailyForecast.icon;
    cell.temperatureLabel.text = [NSString stringWithFormat:@"%.0f", dailyForecast.temperature];
    
    return cell;
}


// Search Bar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_dailyForecastController fetchForecastForZipcode:searchBar.text completionBlock:^(NSArray *dailyForecasts, NSError *error) {
        if (error) {
            NSLog(@"Error searching for zip %@", error);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.dailyForecastController.dailyForecasts = dailyForecasts;
            [[self collectionView] reloadData];
        });
    }];
}

@end
