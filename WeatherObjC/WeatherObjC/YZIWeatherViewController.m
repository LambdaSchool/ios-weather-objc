//
//  YZIWeatherViewController.m
//  WeatherObjC
//
//  Created by Yvette Zhukovsky on 1/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "YZIWeatherViewController.h"
#import "YZIWeather.h"
#import "YZIWeatherCollectionViewCell.h"
#import "YZIWeatherController.h"

@interface YZIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchZip;

@property (weak, nonatomic) IBOutlet UICollectionView *weatherView;



@end

@implementation YZIWeatherViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _weatherController = [[YZIWeatherController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _weatherController = [[YZIWeatherController alloc] init];
    }
    return self;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    _searchZip.delegate = self ;
    _weatherView.dataSource = self ;
    
    
    // Do any additional setup after loading the view.
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
