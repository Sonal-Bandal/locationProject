//
//  fourthViewController.h
//  2AprilJsonTask
//
//  Created by Felix-ITS 004 on 02/04/18.
//  Copyright © 2018 sonal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myTableViewCell.h"

@interface fourthViewController : UIViewController
//<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property CGFloat lat3,lon3;
@property NSString* locationType;
-(void)totalParse;
@property NSMutableArray *vicinityArray,*ratingArray;
@property NSData *iconData;
@property NSMutableArray *tempArray;

@property (strong, nonatomic) IBOutlet UILabel *mylabel;
@property (strong, nonatomic) IBOutlet UILabel *secondLabel;
@property NSDictionary *data;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;


@property (strong, nonatomic) IBOutlet UILabel *locationNamelabel;


@end
