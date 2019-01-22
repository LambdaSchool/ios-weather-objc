//
//  ViewController.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        _weatherController = [[NKTWeatherController alloc] init];
    }
    return self;
}


-(instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if(self)
    {
        _weatherController = [[NKTWeatherController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.collectionView.dataSource = self;
    
}


@end
