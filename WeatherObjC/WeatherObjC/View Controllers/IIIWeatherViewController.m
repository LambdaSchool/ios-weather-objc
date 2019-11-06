//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "IIIForecastController.h"
#import "IIIForecast.h"
#import "IIIWeatherCollectionViewCell.h"

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation IIIWeatherViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		_forecastController = [[IIIForecastController alloc] init];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.collectionView.dataSource = self;
	self.searchBar.delegate = self;
	
	[self.searchBar becomeFirstResponder];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.forecastController.forecastArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	static NSString * identifier = @"WeatherCell";
	
	IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
	
	if (cell == nil) {
		return [[UICollectionViewCell alloc] init];
	}
	
	IIIForecast *forecast = self.forecastController.forecastArray[indexPath.item];
	[cell configCell:forecast];
	
	return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	NSString *zipString = searchBar.text;
	if (zipString != nil || ![zipString  isEqual: @""]) {
		[self.forecastController fetchForecastForZipCode:zipString completitionBlock:^(BOOL success) {
			if (success) {
				dispatch_async(dispatch_get_main_queue(), ^{
					self.cityNameLabel.text = self.forecastController.city;
					[self.collectionView reloadData];
					[self.searchBar resignFirstResponder];
				});
			}
		}];
	}
}

@end
