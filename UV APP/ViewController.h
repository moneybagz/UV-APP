//
//  ViewController.h
//  UV APP
//
//  Created by Clyfford Millet on 7/15/16.
//  Copyright © 2016 Clyff IOS supercompany. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MoreWeatherViewController.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property(nonatomic, strong) NSString *latitude;
@property(nonatomic, strong) NSString *longitude;
@property(nonatomic, strong) NSString *uvIndex;
@property(nonatomic, strong) NSString *uvString;
@property(nonatomic) UIColor *color;

//@property(nonatomic, strong) NSString *temperatureFaren;
//@property(nonatomic, strong) NSString *skyDescription;
//@property(nonatomic, strong) NSString *humidity;
//@property(nonatomic, strong) NSString *airPressure;

//@property (strong, nonatomic) IBOutlet UIView *hello;
//@property (weak, nonatomic) IBOutlet UIView *scrollView;
//@property (weak, nonatomic) IBOutlet UIView *mainView;
//@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *hideButton;

- (IBAction)hideButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *uiindexLabel;
@property (weak, nonatomic) IBOutlet UITextView *textScroll;
//@property (weak, nonatomic) IBOutlet UILabel *UVindexScale;
- (IBAction)readmoreButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *readButton;
- (IBAction)moreWeather:(id)sender;


@property(strong, nonatomic)NSArray *gradients;
//@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
//@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
//@property (weak, nonatomic) IBOutlet UILabel *airPressureLabel;
//@property (weak, nonatomic) IBOutlet UILabel *skyDescriptionLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *cloudsImage;

@property (weak, nonatomic) IBOutlet UIView *gradientView;


@end

