//
//  nextViewController.m
//  2AprilJsonTask
//
//  Created by Felix-ITS 004 on 02/04/18.
//  Copyright © 2018 sonal. All rights reserved.
//

#import "nextViewController.h"

@interface nextViewController ()

@end

@implementation nextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameArray=[[NSMutableArray alloc]initWithObjects:@"atm",@"bank",@"bus-station",@"garden",@"mall", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *CELL=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    CELL.textLabel.text=[self.nameArray objectAtIndex:indexPath.row];
    return CELL;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    thirdViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"thirdViewController"];
    tvc.lat2=self.lat1;
    tvc.lon2=self.lon1;
    tvc.type=cell.textLabel.text;
    [self.navigationController pushViewController:tvc animated:YES];
}
//- (IBAction)nextBtnAction:(UIButton *)sender
//{
//    thirdViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"thirdViewController"];
//    [self.navigationController pushViewController:tvc animated:YES];
//}
@end
