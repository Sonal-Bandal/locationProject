//
//  fourthViewController.m
//  2AprilJsonTask
//
//  Created by Felix-ITS 004 on 02/04/18.
//  Copyright © 2018 sonal. All rights reserved.
//

#import "fourthViewController.h"

@interface fourthViewController ()

@end

@implementation fourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.tableView registerNib:[UINib nibWithNibName:@"myTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
//    self.vicinityArray=[[NSMutableArray alloc]init];
//    self.ratingArray=[[NSMutableArray alloc]init];
//    self.tempArray=[[NSMutableArray alloc]init];
    NSLog(@" DIC IS :%@",self.data);
    self.locationNamelabel.text=[self.data valueForKey:@"name"];
    NSString *icon=[self.data valueForKey:@"icon"];
    NSURL *iconurl=[NSURL URLWithString:icon];
    self.iconData=[NSData dataWithContentsOfURL:iconurl];
   
   // self.ratingLabel.text=[NSString stringWithFormat:@"%@",[self.data valueForKey:@"rating"]];
    
    if ([self.data valueForKey:@"rating"] != [NSNull null])
    {
        self.ratingLabel.text=[NSString stringWithFormat:@"%@",[self.data valueForKey:@"rating"]];// here rating is in the form of a number so used nsstring stringWtihFormat method..

    }
    else
    {
        NSLog(@"no value");
        self.ratingLabel.text=@"";
    }
////    if([self.data objectForKey@"rating"] != [NSNull null]) {
////        
////    }
////    
//    
//    
//    
    self.nameLabel.numberOfLines=0;
    self.nameLabel.lineBreakMode=NSLineBreakByWordWrapping;
//
//    
//    
    self.myImageView.image=[UIImage imageWithData:self.iconData];
    self.nameLabel.text=[self.data valueForKey:@"vicinity"];
    //[self totalParse];
    //self.secondLabel.text=selfaddress;
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
//-(void)totalParse
//{
//    NSString *str=[NSString stringWithFormat:@"//maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&type=%@&radius=500&key=AIzaSyCZNE2AzV61L0_ApuMIbnghMBeeIYrgQ5I",self.lat3,self.lon3,self.locationType];
//    NSURL *myurl=[NSURL URLWithString:str];
//    NSLog(@"url is :%@",myurl);
//    
//    
//    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    
//    NSURLSessionDataTask *datatask=[session dataTaskWithURL:myurl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSHTTPURLResponse *myResponse=(NSHTTPURLResponse *)response;
//        if (myResponse.statusCode==200) {
//            NSLog(@"response found");
//            
//            if (data)
//            {
//                NSLog(@"data found :::%@",myResponse);
//                
//                NSDictionary *firstdictionary=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//                
//                NSArray *results2=[firstdictionary valueForKey:@"results"];
//                
//                
//        
////                NSString *location=[results2 valueForKey:@"vicinity"];
////                [self.tempArray addObject:location];
////                if (self.tempArray.count>0) {
////                    [self performSelectorOnMainThread:@selector(updateUI) withObject:self waitUntilDone:NO];
////                }
//                
//                
//                for (NSDictionary *lastDictionary in results2)
//                {
//                    NSString *icon=[lastDictionary valueForKey:@"icon"];
//                    NSURL *iconurl=[NSURL URLWithString:icon];
//                    self.iconData=[NSMutableData dataWithContentsOfURL:iconurl];
//                    
////                    NSString *rating=[lastDictionary valueForKey:@"rating"];
////                    NSLog(@"%@",rating);
////                    [self.ratingArray addObject:rating];
//                   NSString *address=[lastDictionary valueForKey:@"vicinity"];
//                    NSLog(@"%@",address);
//                    self.secondLabel.text=@"dfdgrytu";
//                    [self.vicinityArray addObject:address];
//                }
//                if (self.ratingArray.count>0) {
//                    [self performSelectorOnMainThread:@selector(updateUI) withObject:self waitUntilDone:NO];
//                }
//                if (self.vicinityArray.count>0) {
//                    [self performSelectorOnMainThread:@selector(updateUI) withObject:self waitUntilDone:NO];
//                }
//            }
//        }
//    }];
//    [datatask resume];
//    
//    
//}
//-(void)updateUI
//{
//    [self.tableView reloadData];
//}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return  self.vicinityArray.count;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    myTableViewCell *myCell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
//    myCell.myCell.text=[self.data valueForKey:@"vicinity"];
//    myCell.myImageView.image=[UIImage imageWithData:self.iconData];
//    
//    //myCell.myCell.text=[self.vicinityArray objectAtIndex:indexPath.row];
//   // myCell.myImageView.image=[UIImage imageWithData:self.iconData];
//    return myCell;
////    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
////    cell.textLabel.text=[self.vicinityArray objectAtIndex:indexPath.row];
////    //cell.detailTextLabel.text=[self.ratingArray objectAtIndex:indexPath.row];
////    cell.imageView.image=[UIImage imageWithData:self.iconData];
////    return cell;
//}


@end
