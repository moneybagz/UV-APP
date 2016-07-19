//
//  MoreWeatherViewController.m
//  UVAPP
//
//  Created by Clyfford Millet on 7/18/16.
//  Copyright © 2016 Clyff IOS supercompany. All rights reserved.
//

#import "MoreWeatherViewController.h"

@implementation MoreWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view setBackgroundColor: self.color];
    
    [self prepareLocationManager];
}
//
//-(void)colorForMoreWeatherViewController:(UIColor *)color{
//    self.color = color;
//    
//}
-(void)viewWillAppear:(BOOL)animated
{
   // self.doesThisWorkView.backgroundColor = self.color;
  //  self.view.backgroundColor = self.color;
    
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareLocationManager {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation * updatedLocation = locations[0];
    
    self.latitude = [NSString stringWithFormat:@"%.0f", updatedLocation.coordinate.latitude];
    self.longitude = [NSString stringWithFormat:@"%.0f", updatedLocation.coordinate.longitude];
    NSLog(@"Latitude : %@", self.latitude);
    NSLog(@"Longitude : %@", self.longitude);
    //[self getData];
    [self getWeatherData];
    [self.locationManager stopUpdatingLocation];
    
    
}

-(void)getWeatherData {
    //    NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/v3/uvi/40.7,-74.2/current.json?appid=d537d182d506e0d3c152e115f5cc8e16"];



    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%@&lon=%@&units=imperial&appid=d537d182d506e0d3c152e115f5cc8e16", self.latitude, self.longitude]];


    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.HTTPMethod = @"GET";


    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {


                    NSError *jsonError;
                    NSDictionary *jsonToDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                     options:NSJSONReadingMutableContainers
                                                                                       error:&jsonError];

                    NSLog(@"%@",jsonToDictionary);
                    NSDictionary *main = [jsonToDictionary objectForKey:@"main"];
                    self.temperatureFaren = [main objectForKey:@"temp"];
                    self.humidity = [main objectForKey:@"humidity"];
                    self.airPressure = [main objectForKey:@"pressure"];
                    NSArray *weatherArray = [jsonToDictionary objectForKey:@"weather"];
                    NSDictionary *weatherDict = weatherArray[0];


                    self.skyDescription = [weatherDict objectForKey:@"description"];

                    NSLog(@"%@",self.temperatureFaren);
                    NSLog(@"%@",self.humidity);
                    NSLog(@"%@",self.airPressure);
                    NSLog(@"%@",self.skyDescription);

                    dispatch_async(dispatch_get_main_queue(), ^{

                        //CHANGE ANY VIEWS THAT CORRESPOND TO UV INDEX




                        self.temperatureData.text = [NSString stringWithFormat:@"%@ F", self.temperatureFaren];
                        self.humidityData.text = [NSString stringWithFormat:@"%@%%", self.humidity];
                        self.airPressureData.text = [NSString stringWithFormat:@"%@ hPa", self.airPressure];
                        self.skyData.text = [NSString stringWithFormat:@"%@", self.skyDescription];
                    });


                }]
     resume];

}





@end
