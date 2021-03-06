//
//  ViewController.m
//  UV APP
//
//  Created by Clyfford Millet on 7/15/16.
//  Copyright © 2016 Clyff IOS supercompany. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.textScroll setHidden:YES];
    
//    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    //scrollView.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:scrollView];
//    
//    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2)];
//    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, scrollView.frame.size
//                                                              .width, scrollView.frame.size.height)];
//    redView.backgroundColor = [UIColor redColor];
//    [scrollView addSubview:redView];
    

    
   
    // Do any additional setup after loading the view, typically from a nib.
//    CAGradientLayer *backgroundLayer = [self purpleGradientLayer];
//    backgroundLayer.frame = self.view.frame;
//    [self.mainView.layer insertSublayer:backgroundLayer atIndex:0];
    
    
    [self prepareLocationManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CAGradientLayer *)yellowGradientLayer
{
    UIColor *topColor = [UIColor colorWithRed:1 green:0.92 blue:0.56 alpha:0];
    UIColor *bottomColor = [UIColor colorWithRed:1 green:0.92 blue:0.56 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

//RED

-(CAGradientLayer *)redGradientLayer
{
    UIColor *topColor = [UIColor colorWithRed:1 green:0.2 blue:0.0 alpha:0];
    UIColor *bottomColor = [UIColor colorWithRed:1 green:0.2 blue:0.0 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

-(CAGradientLayer *)greenGradientLayer
{
    UIColor *topColor = [UIColor colorWithRed:0 green:1 blue:0.2 alpha:0];
    UIColor *bottomColor = [UIColor colorWithRed:0 green:1 blue:0.2 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

-(CAGradientLayer *)orangeGradientLayer
{
    UIColor *topColor = [UIColor colorWithRed:1 green:.4 blue:0.0 alpha:0];
    UIColor *bottomColor = [UIColor colorWithRed:1 green:.4 blue:0.0 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

-(CAGradientLayer *)purpleGradientLayer
{
    UIColor *topColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:0];
    UIColor *bottomColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

-(void)chooseUVcolor:(double)uvIndex
{
    if (uvIndex <= 2.9 ){
        CAGradientLayer *backgroundLayer = [self greenGradientLayer];
        backgroundLayer.frame = self.view.frame;
        [self.mainView.layer insertSublayer:backgroundLayer atIndex:0];
    }
    
    if (uvIndex > 2.9 && uvIndex <= 5.9){
        CAGradientLayer *backgroundLayer = [self yellowGradientLayer];
        backgroundLayer.frame = self.view.frame;
        [self.mainView.layer insertSublayer:backgroundLayer atIndex:0];
    }
    
    if (uvIndex > 5.9 && uvIndex <= 7.9){
        CAGradientLayer *backgroundLayer = [self orangeGradientLayer];
        backgroundLayer.frame = self.view.frame;
        [self.mainView.layer insertSublayer:backgroundLayer atIndex:0];
    }
    
    if (uvIndex > 7.9 && uvIndex <= 10.9){
        CAGradientLayer *backgroundLayer = [self redGradientLayer];
        backgroundLayer.frame = self.view.frame;
        [self.mainView.layer insertSublayer:backgroundLayer atIndex:0];
    }
    
    if (uvIndex > 10.9){
        CAGradientLayer *backgroundLayer = [self purpleGradientLayer];
        backgroundLayer.frame = self.view.frame;
        [self.mainView.layer insertSublayer:backgroundLayer atIndex:0];
    }
    
}

-(void)prepareLocationManager {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
}

-(void)getData {
    //    NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/v3/uvi/40.7,-74.2/current.json?appid=d537d182d506e0d3c152e115f5cc8e16"];
    
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/v3/uvi/%@,%@/current.json?appid=d537d182d506e0d3c152e115f5cc8e16", self.latitude, self.longitude]];
    
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.HTTPMethod = @"GET";
    
    
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    
                    
                    NSError *jsonError;
                    NSDictionary *jsonToDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                     options:NSJSONReadingMutableContainers
                                                                                       error:&jsonError];
                    
//                    [NSString stringWithFormat:@"%lf", [abc doubleValue]
                    self.uvIndex = [jsonToDictionary objectForKey:@"data"];
                    self.uvString = [NSString stringWithFormat:@"%.1lf", [self.uvIndex doubleValue]];
                    NSLog(@"%@",self.uvIndex);
                    
                    
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        //CHANGE ANY VIEWS THAT CORRESPOND TO UV INDEX
                        self.uiindexLabel.text = self.uvString;
                        double uvIndex = [self.uvIndex doubleValue];
                        [self chooseUVcolor:uvIndex];
                        [self changeTextFields:uvIndex];
                        
                    });
                    
                    
                }]
     resume];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation * updatedLocation = locations[0];
    
    self.latitude = [NSString stringWithFormat:@"%.0f", updatedLocation.coordinate.latitude];
    self.longitude = [NSString stringWithFormat:@"%.0f", updatedLocation.coordinate.longitude];
    NSLog(@"Latitude : %@", self.latitude);
    NSLog(@"Longitude : %@", self.longitude);
    [self getData];
    [self.locationManager stopUpdatingLocation];
    
    
}

-(void)changeTextFields:(double)uvIndex{
    
    NSArray *textForUVIndexValue = @[ @"UV Index is low. Wear sunglasses on bright days. If you burn easily, cover up and use broad spectrum SPF 30+ sunscreen. Watch out for bright surfaces, like sand, water and snow, which reflect UV and increase exposure.", @"UV Index is moderate. Stay in shade near midday when the sun is strongest. If outdoors, wear protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Watch out for bright surfaces, like sand, water and snow, which reflect UV and increase exposure.", @"UV Index is high risk of harm from unprotected sun exposure. Protection against skin and eye damage is needed. Reduce time in the sun between 10 a.m. and 4 p.m. If outdoors, seek shade and wear protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Watch out for bright surfaces, like sand, water and snow, which reflect UV and increase exposure.",@"UV Index is very high. Take extra precautions because unprotected skin and eyes will be damaged and can burn quickly. Minimize sun exposure between 10 a.m. and 4 p.m. If outdoors, seek shade and wear protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Watch out for bright surfaces, like sand, water and snow, which reflect UV and increase exposure. A UV Index reading of 11 or more means extreme risk of harm from unprotected sun exposure. Take all precautions because unprotected skin and eyes can burn in minutes. Try to avoid sun exposure between 10 a.m. and 4 p.m. If outdoors, seek shade and wear protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Watch out for bright surfaces, like sand, water and snow, which reflect UV and increase exposure."];
    if ( uvIndex < 3){
        self.textScroll.text = [textForUVIndexValue objectAtIndex:0];
    }
    if (( uvIndex >= 3) && (uvIndex < 6)){
        self.textScroll.text = [textForUVIndexValue objectAtIndex:1];
    }
    if (( uvIndex == 6)|| (uvIndex== 7)){
        self.textScroll.text = [textForUVIndexValue objectAtIndex:2];
    }
    if (( uvIndex > 7 )){
        self.textScroll.text = [textForUVIndexValue objectAtIndex:2];
    }
}





- (IBAction)readmoreButton:(id)sender {
    [self.textScroll setHidden:NO];
}
@end
