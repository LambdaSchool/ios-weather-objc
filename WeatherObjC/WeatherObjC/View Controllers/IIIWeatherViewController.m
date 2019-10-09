//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "IIIDailyForecastController.h"
#import "IIIWeatherCollectionViewCell.h"

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation IIIWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//	self.collectionView.delegate = self;
	self.collectionView.dataSource = self;
	self.searchBar.delegate = self;
}


- (instancetype)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		_forecastController = [[IIIDailyForecastController alloc] init];
	}
	return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
		_forecastController = [[IIIDailyForecastController alloc] init];
	}
	return self;
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
	IIIWeatherCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];

//	cell.

	return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.forecastController.forecasts.count;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[self.forecastController fetchForecastsFrom:searchBar.text completionBlock:^(NSArray *forecasts, NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^(void){
			[self.collectionView reloadData];
		});
	}];
}

@end
