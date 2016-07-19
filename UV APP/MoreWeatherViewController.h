//
//  MoreWeatherViewController.h
//  UVAPP
//
//  Created by Clyfford Millet on 7/18/16.
//  Copyright © 2016 Clyff IOS supercompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface MoreWeatherViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property(nonatomic, strong) NSString *latitude;
@property(nonatomic, strong) NSString *longitude;

@property (weak, nonatomic) IBOutlet UILabel *temperatureData;
@property (weak, nonatomic) IBOutlet UILabel *humidityData;
@property (weak, nonatomic) IBOutlet UILabel *airPressureData;
@property (weak, nonatomic) IBOutlet UILabel *skyData;

@property(nonatomic, strong) NSString *temperatureFaren;
@property(nonatomic, strong) NSString *skyDescription;
@property(nonatomic, strong) NSString *humidity;
@property(nonatomic, strong) NSString *airPressure;
@property(nonatomic, retain) UIColor *color;
//-(void)colorForMoreWeatherViewController:(UIColor *)color;
@end
