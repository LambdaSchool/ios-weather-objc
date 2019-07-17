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

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;



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
	
	
	
	NSString *zip = @"91006";
	
	[_forcastController fetchForcastFromZipCode:zip completionBlock:^(NSArray * _Nonnull fiveForcast, NSError * _Nonnull error) {
		NSLog(@"%ld", fiveForcast.count);
		self.sevenForcast = fiveForcast;
		NSLog(@"%@", self.sevenForcast);
		
		//dispatchQue
//		[self.collectionView reloadData];
		
	}];
	
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
