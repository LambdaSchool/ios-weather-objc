//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "../Model Controller/IIIForcastController.h"
#import "../Models/IIIForcast.h"
#import "../Views/IIIWeatherCollectionViewCell.h"
@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property NSArray *sevenDayForcast;



@end

@implementation IIIWeatherViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
	self = [super initWithCoder:aDecoder];
	if (self) {
		_forcastController = [[IIIForcastController alloc] init];
		
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.collectionView.delegate = self;
	self.collectionView.dataSource = self;
	self.searchBar.delegate = self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	return self.sevenDayForcast.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
	cell.tempLabel.text = @"100";
//	cell.imageView.image =;
	return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
	//91006
	if (searchText.length == 5) {
		[self.forcastController fetchForcastFromZipCode:searchText completionBlock:^(NSError * _Nonnull error) {
		}];
	}
	
	[self.collectionView reloadData];
}


@end
