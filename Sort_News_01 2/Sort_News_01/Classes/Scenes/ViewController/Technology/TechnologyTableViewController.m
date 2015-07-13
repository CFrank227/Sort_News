//
//  TechnologyTableViewController.m
//  Sort_News_01
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

#import "TechnologyTableViewController.h"
#import "News.h"
#import "TechnologyTableViewCell.h"
#import "Technology.h"

@interface TechnologyTableViewController ()


@property (nonatomic, strong) NSMutableArray *allDataArray;

@property (nonatomic, strong) NSMutableArray *dataArray;



@end

@implementation TechnologyTableViewController

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
    //    http://zzd.sm.cn/appservice/api/v1/channel/1525483516?bid=997&count=20&recoid=&client_version=2.1.0.1&summary=1&content_cnt=20&city=010&m_ch=000&ftime=0&summary_len=0&client_os=ios&sn=1b16325fd47a283b282a3ed8eb70ef30&method=new
    
    
   NSString *urlStr = [ NSString stringWithFormat:@"http://zzd.sm.cn/appservice/api/v1/channel/1525483516?bid=997&count=20&recoid=&client_version=2.1.0.1&summary=1&content_cnt=20&city=010&m_ch=000&ftime=0&summary_len=0&client_os=ios&sn=1b16325fd47a283b282a3ed8eb70ef30&method=new"];
   
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    self.allDataArray = [NSMutableArray new];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    TechnologyTableViewController *weakSelf = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithDictionary:dict[@"data"]];
        for (NSDictionary *item in dict1[@"article"]) {
            Technology *model = [Technology new];
            [model setValuesForKeysWithDictionary:item];
            [_allDataArray addObject:model];
        }
        [weakSelf.tableView reloadData];
    }];

    /*
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    
//    NSLog(@"%@", data);
//    
//    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//    
//    for (NSDictionary *item1 in dict[@"data"]) {
//         NSLog(@"%@",item1);
//        
//       
//            
//        
//        Technology *news = [Technology new];
//        [news setValuesForKeysWithDictionary:item1];
//        [weakSelf.allDataArray addObject:news];
//        
//        [weakSelf.tableView reloadData];
//    }
//    for (NSDictionary *item2 in dict[@"result"]) {
//        NSLog(@"%@",item2);
//    }
    

//    self.allDataArray = [NSMutableArray array];
//    __block typeof(self) weakSelf = self;
//    
//    NSMutableDictionary *paramMutableDict = [NSMutableDictionary dictionary];
//    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
//    [manage GET:@"http://zzd.sm.cn/appservice/api/v1/channel/1525483516?bid=997&count=20&recoid=&client_version=2.1.0.1&summary=1&content_cnt=20&city=010&m_ch=000&ftime=0&summary_len=0&client_os=ios&sn=1b16325fd47a283b282a3ed8eb70ef30&method=new" parameters:paramMutableDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        for (NSDictionary *item in responseObject[@"data"]) {
//            @autoreleasepool {
//                News *news = [News new];
//                [news setValuesForKeysWithDictionary:item];
//                [weakSelf.allDataArray addObject:news];
//            }
//        }
//        [weakSelf.tableView reloadData];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@", error.localizedDescription);
//    }];
    
    */
    
   
    
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
    static NSString *CellIdentifier = @"cell";
//    TechnologyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    

    if (cell == nil) {
        cell = [[TechnologyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
        Technology *news = _allDataArray[indexPath.row];
    
    
//    cell.textLabel.text = news.title;
    //cell.textLabel.text = news.content;
    
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"<p>"];
    news.content = [[news.content componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];
    NSCharacterSet *doNotWant1 = [NSCharacterSet characterSetWithCharactersInString:@"</p>"];
    news.content = [[news.content componentsSeparatedByCharactersInSet: doNotWant1]componentsJoinedByString: @""];
    cell.textLabel.text = news.content;
    cell.textLabel.font = [UIFont systemFontOfSize: 15];
    cell.textLabel.numberOfLines = 0;
    
    
      return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Technology *news = _allDataArray[indexPath.row];
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,MAXFLOAT);
    CGSize textSize = [news.content sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:maxSize];
    
    CGFloat height = CGRectGetMaxY(CGRectMake(0, 0, textSize.width, textSize.height));
    
    
    
    
    
    
    
    return height + 40;
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
