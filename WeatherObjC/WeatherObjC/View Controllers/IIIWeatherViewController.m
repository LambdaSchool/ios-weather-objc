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

@property NSNumberFormatter *tempFormatter;

@end

@implementation IIIWeatherViewController

#pragma mark Init / Setup / View Lifecycle

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp {
    _forecastController = [[JBForecastController alloc] init];
    _tempFormatter = [[NSNumberFormatter alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.searchBar.delegate = self;

    self.cityNameLabel.text = @"";
}

#pragma mark - Collection View Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.forecastController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell"
                                                                                   forIndexPath:indexPath];
    cell.forecast = [self.forecastController.forecasts objectAtIndex:indexPath.item];

    return cell;
}

#pragma mark - Search Bar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self fetchForecastsForZipCode:searchBar.text];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Helper methods

-(void)fetchForecastsForZipCode:(NSString *)zipCode {
    [self.forecastController fetchForecastsForZipCode:zipCode
                                           completion:^(NSArray *forecasts, NSError *error) {
        if (error) {
            NSLog(@"Error fetching forecasts: %@", error);
            // TODO: Handle error better
            return;
        }

        JBForecast *firstForecast = forecasts.firstObject;

//        for (NSUInteger i = 0; i < forecasts.count; i++) {
//            [self fetchIconForForecast:forecasts[i]
//                             indexPath:[NSIndexPath indexPathForItem:i
//                                                           inSection:0]];
//        }

        dispatch_async(dispatch_get_main_queue(), ^{
            self.cityNameLabel.text = firstForecast.cityName;
            [self.collectionView reloadData];
        });
    }];
}

//// TODO: cancel data task if new search is performed
//// TODO: cache icons
//-(void)fetchIconForForecast:(JBForecast *)forecast indexPath:(NSIndexPath *)indexPath {
//    [self.forecastController fetchIconImageForCode:forecast.iconCode
//                                        completion:^(UIImage *image,
//                                                     NSError *error) {
//        if (error) {
//            NSLog(@"Error fetching icon %@: %@", forecast.iconCode, error);
//            return;
//        }
//
//        forecast.iconImage = image;
//
//        dispatch_async(dispatch_get_main_queue(), ^{;
//            [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
//        });
//    }];
//}

@end
