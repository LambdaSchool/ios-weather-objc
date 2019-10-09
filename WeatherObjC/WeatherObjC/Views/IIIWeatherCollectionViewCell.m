//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "IIIDailyForecast.h"

@interface IIIWeatherCollectionViewCell() {
	NSDateFormatter* _timeFormatter;
}

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation IIIWeatherCollectionViewCell

- (void)awakeFromNib {
	[super awakeFromNib];

	_timeFormatter = [[NSDateFormatter alloc] init];
	_timeFormatter.dateFormat = @"MM/dd h a";
}

- (void)setForecast:(IIIDailyForecast *)forecast {
	_forecast = forecast;

	[self updateViews];
}

- (void)updateViews {
	if (self.forecast) {
		self.temperatureLabel.text = [NSString stringWithFormat:@"%.02f", self.forecast.highTemperature];
		self.timeLabel.text = [_timeFormatter stringFromDate: self.forecast.date];
		[self loadImage];
	}
}

- (void)loadImage {
	NSURLSessionDataTask* imageFetch = [[NSURLSession sharedSession] dataTaskWithURL:self.forecast.imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			NSLog(@"Error downloading image: %@", error);
			return;
		}

		UIImage* image = [UIImage imageWithData:data];
		dispatch_async(dispatch_get_main_queue(), ^(void){
			self.weatherImageView.image = image;
		});
	}];
	[imageFetch resume];
}


@end
