//
//  ViewController.h
//  2AprilJsonTask
//
//  Created by Felix-ITS 004 on 02/04/18.
//  Copyright © 2018 sonal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "nextViewController.h"

@interface ViewController : UIViewController<MKMapViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *LOCATIONTEXTFIELD;
@property (strong, nonatomic) IBOutlet MKMapView *MYMAPVIEW;
- (IBAction)NEXTBUTTONAction:(UIButton *)sender;



-(void)findLocation;
-(void)parseData;
@property CGFloat latitude,longitude;

@property NSString *key;

-(void)initializewith:(CGFloat)lat andwithlongitude:(CGFloat)lon andwiththekey :(NSString *)mykey;

@property NSArray *results;


@end

