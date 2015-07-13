//
//  FunnyTableViewController.m
//  Sort_News_01
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

#import "FunnyTableViewController.h"
#import "FunnyTableViewCell.h"
#import "Funny.h"
#import "MJRefresh.h"



@interface FunnyTableViewController ()

@property (nonatomic, retain) NSMutableArray *allDataArray;
@property (nonatomic, assign) CGFloat cellHeight;
- (void)loadData;

@end

@implementation FunnyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
    // 下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    [self.tableView registerClass:[FunnyTableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    // http://v.youku.com/v_show/id_XNjIyMjY4MjM2.html?from=y1.2-2.4.1
    NSString *videoUrl = @"http://v.youku.com/v_show/id_XNjIyMjY4MjM2.html?from=y1.2-2.4.1";
    
//    UIVideoEditorController *uiVideo = [UIVideoEditorController canEditVideoAtPath:videoUrl];
    
    
    
}

- (void)loadData
{
    self.allDataArray = [NSMutableArray array];
    __block typeof(self) weakSelf = self;
    NSString *urlStr = @"http://zzd.sm.cn/appservice/api/v1/channel/1670553277?bid=997&count=20&recoid=5657476440874081234&client_version=2.1.0.1&summary=1&content_cnt=20&city=010&m_ch=000&ftime=1436255369075&summary_len=0&client_os=ios&sn=1b16325fd47a283b282a3ed8eb70ef30&method=new";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:mutableRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        NSLog(@"%@", data);
      NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"%@", dict);
        NSDictionary *dict2 = [dict objectForKey:@"data"];
        NSArray *array = [dict2 objectForKey:@"article"];
        for (NSDictionary *item in array) {
            Funny *funny = [Funny new];
            [funny setValuesForKeysWithDictionary:item];
//            NSLog(@"%@", funny);
            [weakSelf.allDataArray addObject:funny];
        }
        [weakSelf.tableView reloadData];
    }];
}





- (void)headerRereshing
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self loadData];
//        NSLog(@"刷新了数据");
        [self.tableView headerEndRefreshing];
    });
}

//- (void)



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
    NSLog(@"count %ld", _allDataArray.count);
    return _allDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuse = @"reuseIdentifier";
    
    FunnyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[FunnyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuse];
    }
    Funny *funny = _allDataArray[indexPath.row];
//    NSLog(@" 内容  %@", funny.summary);
    NSString *text = funny.summary;
    cell.contentLabel.text = text;
//    cell.contentLabel.backgroundColor = [UIColor cyanColor];
    CGSize maxSize = CGSizeMake(300, CGFLOAT_MAX);
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys: cell.contentLabel.font, NSFontAttributeName, nil];
    
//    NSDictionary *frontDict = @{   };
    
    CGRect rect = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    
    
    NSLog(@"height %f", rect.size.height);
    _cellHeight = rect.size.height;
    
    
    
    CGRect logoLabelFrame = cell.logoLabel.frame;
    logoLabelFrame.origin.y = rect.size.height;
    NSLog(@"logola %f", logoLabelFrame.size.height);
    cell.logoLabel.frame = logoLabelFrame;
//    cell.logoLabel.frame.
    
    
    
    
    cell.contentLabel.frame = CGRectMake(10, 5, 355, rect.size.height);
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  _cellHeight + 20;
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
