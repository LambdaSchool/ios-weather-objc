//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "IIIWeatherController.h"
#import "IIIWeatherCollectionViewCell.h"
#import "IIIWeather.h"

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation IIIWeatherViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _weatherController = [[IIIWeatherController alloc] init];
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self collectionView] setDelegate:self];
    [[self collectionView] setDataSource:self];
    [[self searchBar] setDelegate:self];
    
    [[self cityNameLabel] setText:@""];
    
    [[self searchBar] becomeFirstResponder];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[[self weatherController] weatherList] count];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    IIIWeather *weather = [[[self weatherController] weatherList] objectAtIndex:[indexPath row]];
    
    [[self cityNameLabel] setText:[weather cityName]];
    
    [cell updateTextLabelWithTemp:[weather temp] image:[weather weaatherImage]];
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSNumber *zip = [formatter numberFromString:[searchBar text]];
    
    [[self weatherController] fetchWeatherFromZip:zip withCompletion:^(NSDictionary * _Nonnull json, NSError * _Nonnull error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self collectionView] reloadData];
        });
        
    }];
}


@end
