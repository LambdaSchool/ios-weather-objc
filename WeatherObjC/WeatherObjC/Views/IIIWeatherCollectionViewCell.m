//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "IIIForecast.h"

@interface IIIWeatherCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

@implementation IIIWeatherCollectionViewCell

- (void)configCell:(IIIForecast *)forecast {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"E, MMM dd"];
	
	NSString *styledDate = [dateFormatter stringFromDate:forecast.date];
	int cleanTemp = (int)floor([forecast.temperature doubleValue]);
	
	self.temperatureLabel.text = [NSString stringWithFormat:@"%@: %d degrees", styledDate, cleanTemp];
	[self.weatherImageView setImage:forecast.icon];
}

@end
