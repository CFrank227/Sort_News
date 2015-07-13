//
//  LocalTableViewController.m
//  Sort_News_01
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

#import "LocalTableViewController.h"
#import "News.h"
#import "TechnologyTableViewCell.h"
@interface LocalTableViewController ()


@property (nonatomic, strong) NSMutableArray *allDataArray;

@property (nonatomic, strong) NSMutableArray *dataArray;
- (void)loadDataAndShow;
@end

@implementation LocalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self loadDataAndShow];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)loadDataAndShow
{
//    self.allDataArray = [NSMutableArray array];
//    __block typeof(self) weakSelf = self;
//    
//    //http://zzd.sm.cn/appservice/api/v1/channel/200?bid=997&count=20&recoid=2568970114365099789&client_version=2.1.0.1&summary=1&content_cnt=20&city=010&m_ch=000&ftime=1436342166332&summary_len=0&client_os=ios&sn=1b16325fd47a283b282a3ed8eb70ef30&method=new
//
//    
//    NSMutableDictionary *paramMutableDcit = [NSMutableDictionary dictionary];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:([NSString stringWithFormat:@"http://zzd.sm.cn/appservice/api/v1/channel/200?bid=997&count=20&recoid=2568970114365099789&client_version=2.1.0.1&summary=1&content_cnt=20&city=010&m_ch=000&ftime=1436342166332&summary_len=0&client_os=ios&sn=1b16325fd47a283b282a3ed8eb70ef30&method=new"]) parameters:paramMutableDcit success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@", responseObject);
//        for (NSDictionary *item in responseObject[@""]) {
//            @autoreleasepool {
//                News *news = [News new];
//                [News];
//            }
//        }
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error.localizedFailureReason);
//    }];
//    
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://zzd.sm.cn/appservice/api/v1/channel/200?bid=997&count=20&recoid=2568970114365099789&client_version=2.1.0.1&summary=1&content_cnt=20&city=010&m_ch=000&ftime=1436342166332&summary_len=0&client_os=ios&sn=1b16325fd47a283b282a3ed8eb70ef30&method=new"]];
//    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    
//    NSDictionary *item = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
//    
    

    NSString *urlStr = [ NSString stringWithFormat:@"http://zzd.sm.cn/appservice/api/v1/channel/200?bid=997&count=20&recoid=2568970114365099789&client_version=2.1.0.1&summary=1&content_cnt=20&city=010&m_ch=000&ftime=1436342166332&summary_len=0&client_os=ios&sn=1b16325fd47a283b282a3ed8eb70ef30&method=new"];
    
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSLog(@"%@", data);
                        
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    for (NSDictionary *item1 in dict[@"data"]) {
        NSLog(@"%@",item1);
    }
    for (NSDictionary *item2 in dict[@"result"]) {
        NSLog(@"%@",item2);
    }
    
    
    
    
    
    
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _allDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"hh";
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     return 140;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
