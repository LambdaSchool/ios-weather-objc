//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "DLJForcastController.h"
#import "DLJForcast.h"
#import "IIIWeatherCollectionViewCell.h"

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation IIIWeatherViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
        _forcastController = [[DLJForcastController alloc] init];
}
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    [[self collectionView] setDelegate:self];
    [[self collectionView] setDataSource:self];
    [[self searchBar] setDelegate: self];
    [[self searchBar] becomeFirstResponder];

}

-(NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[[self forcastController] weatherArray] count];
}

-(nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {

    IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];

    DLJForcast *forcast = [[[self forcastController] weatherArray] objectAtIndex:indexPath.row];

    [[self cityNameLabel] setText:[forcast city]];

    [cell updateTextLabelWithTemp:[forcast temperature] image:[forcast weatherImage]];


    return cell;

}

-(void)searchBarButtonClicked:(UISearchBar *)searchBar {

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];

    NSNumber *zip = [formatter numberFromString:[searchBar text]];

    [[self forcastController] fetchForcastFromZip:zip withCompletion:^(NSDictionary * _Nonnull json, NSError * _Nonnull error) {

        dispatch_async(dispatch_get_main_queue(), ^{
            [[self collectionView] reloadData];
        });
                       }];

}



@end
