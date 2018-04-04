//
//  thirdViewController.m
//  2AprilJsonTask
//
//  Created by Felix-ITS 004 on 02/04/18.
//  Copyright © 2018 sonal. All rights reserved.
//

#import "thirdViewController.h"

@interface thirdViewController ()

@end

@implementation thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.atmNameArray=[[NSMutableArray alloc]init];
    [self parseDATA];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)parseDATA
{
    NSString *str=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&type=%@&radius=500&key=AIzaSyCZNE2AzV61L0_ApuMIbnghMBeeIYrgQ5I",self.lat2,self.lon2,self.type];
    NSURL *myurl=[NSURL URLWithString:str];
    NSLog(@"url is :%@",myurl);
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *datatask=[session dataTaskWithURL:myurl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *myresponse=(NSHTTPURLResponse *)response;
        if (myresponse.statusCode==200) {
            NSLog(@"response found");
            if (data) {
                //NSLog(@"data found is :%@",myresponse);
                
                NSDictionary *mydictionary=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                NSLog(@"-----------mydictionary----------");
                NSLog(@"dic is :%@",mydictionary);
                
                self.results1=[mydictionary valueForKey:@"results"];
                NSLog(@"-----------Result----------");
                NSLog(@"%@",self.results1);
                
                for (NSDictionary *nextDic in self.results1) {
                    NSString *name=[nextDic valueForKey:@"name"];
                    [self.atmNameArray addObject:name];
                    
                }
                if (self.atmNameArray.count>0) {
                    [self performSelectorOnMainThread:@selector(updateUI) withObject:self waitUntilDone:NO];
                }
                
                
            }
        }
    }];
    [datatask resume];

}
-(void)updateUI
{
    [self.mytableview reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.atmNameArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text=[self.atmNameArray objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    fourthViewController *fvc=[self.storyboard instantiateViewControllerWithIdentifier:@"fourthViewController"];
//    fvc.lat3=self.lat2;
//    fvc.lon3=self.lon2;
    fvc.locationType=self.type;
    fvc.data = [self.results1 objectAtIndex:indexPath.row];
    NSLog(@"-----------didSelectRowAtIndexPath----------");
    NSLog(@"%@", [self.results1 objectAtIndex:indexPath.row]);
    
    [self.navigationController pushViewController:fvc animated:YES];
}

@end
