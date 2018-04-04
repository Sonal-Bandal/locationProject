//
//  nextViewController.h
//  2AprilJsonTask
//
//  Created by Felix-ITS 004 on 02/04/18.
//  Copyright © 2018 sonal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "thirdViewController.h"

@interface nextViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)nextBtnAction:(UIButton *)sender;
@property NSMutableArray *nameArray;
@property CGFloat lat1,lon1;


@end
