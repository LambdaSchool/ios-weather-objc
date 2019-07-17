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





- (void)viewDidLoad {
    [super viewDidLoad];
	IIIForcastController *forcastController = [[IIIForcastController alloc] init];
	
	NSString *zip = @"91006";
	
	[forcastController fetchForcastFromZipCode:zip completionBlock:^(NSArray * _Nonnull forcast, NSError * _Nonnull error) {
		
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
