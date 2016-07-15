//
//  ViewController.h
//  UV APP
//
//  Created by Clyfford Millet on 7/15/16.
//  Copyright © 2016 Clyff IOS supercompany. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property(nonatomic, strong) NSString *latitude;
@property(nonatomic, strong) NSString *longitude;
@property(nonatomic, strong) NSString *uvIndex;
@property(nonatomic, strong) NSString *uvString;

@property (strong, nonatomic) IBOutlet UIView *hello;
@property (weak, nonatomic) IBOutlet UIView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;


@property (weak, nonatomic) IBOutlet UILabel *uiindexLabel;
@property (weak, nonatomic) IBOutlet UITextView *textScroll;
@property (weak, nonatomic) IBOutlet UILabel *UVindexScale;
- (IBAction)readmoreButton:(id)sender;

@property(strong, nonatomic)NSArray *gradients;

@end

