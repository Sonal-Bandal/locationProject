//
//  ViewController.m
//  2AprilJsonTask
//
//  Created by Felix-ITS 004 on 02/04/18.
//  Copyright © 2018 sonal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)findLocation
{
    NSString *location=self.LOCATIONTEXTFIELD.text;
    
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    
    [geocoder geocodeAddressString:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count>0) {
            CLPlacemark *myPlacemark=[placemarks objectAtIndex:0];
            
            MKPlacemark *mapPlacemark=[[MKPlacemark alloc]initWithPlacemark:myPlacemark];
            
            MKCoordinateRegion region=self.MYMAPVIEW.region;
            
            region.center=myPlacemark.region.center;
            
            region.span.latitudeDelta/=8.0;
            
            region.span.longitudeDelta/=8.0;
            
            [self.MYMAPVIEW setRegion:region animated:YES];
            
            [self. MYMAPVIEW addAnnotation:mapPlacemark];
            
            self.latitude=region.center.latitude;
            
            self.longitude=region.center.longitude;
            
            [self initializewith:self.latitude andwithlongitude:self.longitude andwiththekey:self.key];
            
            NSLog(@"latitiude=%f and longitude=%f",self.latitude,self.longitude);
            
            [self parseData];
            
        }
    }];
}

-(void)initializewith:(CGFloat)lat andwithlongitude:(CGFloat)lon andwiththekey:(NSString *)mykey
{
    NSString *str1=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=500&key=AIzaSyCZNE2AzV61L0_ApuMIbnghMBeeIYrgQ5I",self.latitude,self.longitude];
    
    NSLog(@"url is :%@",str1);
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // Add an observer that will respond to enteredLocation
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showMainMenu:)
                                                 name:@"enteredLOcation" object:nil];
    
    
    // Post a notification to loginComplete
    [[NSNotificationCenter defaultCenter] postNotificationName:@"enteredLOcation" object:nil];
    
    

    [self findLocation];
    return YES;
}

-(void)parseData
{
    NSString *str=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=500&key=AIzaSyCZNE2AzV61L0_ApuMIbnghMBeeIYrgQ5I",self.latitude,self.longitude];
    NSLog(@"URL IS = = = :%@",str);
    NSURL *myUrl=[NSURL URLWithString:str];
    NSLog(@"URL = = = =:%@",myUrl);
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *datatask=[session dataTaskWithURL:myUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *myresponse=(NSHTTPURLResponse *)response;
        if (myresponse.statusCode==200) {
            NSLog(@"RESPONSE FOUND");
            
            if (data) {
                NSLog(@"DATA FOUND..IT IS :%@",response);
                
                NSDictionary *mainDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                
                NSLog(@"main dici s:%@",mainDic);
                
                self.results=[mainDic valueForKey:@"results"];
                // NSLog(@"%@",self.coordDic);
                
                //                for (NSDictionary *temp  in self.results)
                //                {
                //                    NSString *lat=[temp valueForKey:@"lat"];
                //                    NSLog(@"LATITUDE IS :%@",lat);
                //
                //                    NSString *lon=[temp valueForKey:@"lon"];
                //                    NSLog(@"LONGITUDE IS :%@",lon);
                //
                //                    self.image=[temp valueForKey:@"icon"];
                //                    NSLog(@"ICON IS :%@",self.image);
                //                    [UIImage imageWithData:self.imageDta];
                //                    [self.imageArray addObject:self.imageDta];
                //
                //
                //
                //
                //                }
                //
                //                self.geometry=[self.results valueForKey:@"geometry"];
                //
                //                //NSLog(@"LOCATIONS ARE :%@",self.geometry);
                //
                //                self.location=[self.geometry valueForKey:@"location"];
                //
                //                //NSLog(@"latitude and longitude are:%@",self.location);
                //
                //                NSString *currentLatitude=[self.location valueForKey:@"lat"];
                //
                //                ///NSLog(@"latitude is :%@",currentLatitude);
                //
                //                NSString *currentLongityde=[self.location valueForKey:@"lng"];
                //
                //                //NSLog(@"longitude is :%@",currentLongityde);
                //
                //                NSString *vicinity=[self.results valueForKey:@"vicinity"];
                //
                //               // NSLog(@"vicinity is :%@",vicinity);
                
                
                
                
                
                
            }
        }
    }];
    
    [datatask resume];
    
    
}
- (void)showMainMenu:(NSNotification *)note {
    NSLog(@"Received Notification - Someone seems to have entered in the location name");
}





- (IBAction)NEXTBUTTONAction:(UIButton *)sender
{
    nextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"nextViewController"];
    nvc.lat1=self.latitude;
    nvc.lon1=self.longitude;
    [self.navigationController pushViewController:nvc animated:YES];
}
@end
