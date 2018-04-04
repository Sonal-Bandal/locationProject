//
//  thirdViewController.h
//  2AprilJsonTask
//
//  Created by Felix-ITS 004 on 02/04/18.
//  Copyright © 2018 sonal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "fourthViewController.h"

@interface thirdViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *mytableview;


@property CGFloat lat2,lon2;
-(void)parseDATA;
@property NSString *type;
@property NSMutableArray *atmNameArray;

@property NSArray *results1;



@end
