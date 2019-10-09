//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "IIIDailyForecast.h"

@interface IIIWeatherCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;


@end

@implementation IIIWeatherCollectionViewCell

- (void)setForecast:(IIIDailyForecast *)forecast {
	_forecast = forecast;

	[self updateViews];
}

- (void)updateViews {
	if (self.forecast) {
		self.temperatureLabel.text = [NSString stringWithFormat:@"%.02f", self.forecast.highTemperature];
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
