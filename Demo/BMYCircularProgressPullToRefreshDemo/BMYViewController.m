//
//  BMYViewController.m
//  BMYPullToRefreshDemo
//
//  Created by Alberto De Bortoli on 18/05/2014.
//  Copyright (c) 2014 Beamly. All rights reserved.
//

#import "BMYViewController.h"
#import "BMYCircularProgressView.h"
#import "UIScrollView+BMYPullToRefresh.h"

@interface BMYViewController ()<
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UITableView *tableViewWithContentInset1;
@property (nonatomic, strong) IBOutlet UITableView *tableViewWithContentInset2;

@end

@implementation BMYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupTableView];
    [self _setupTableViewWithContentInset1];
    [self _setupTableViewWithContentInset2];
}

- (void)_setupTableView {
    UIImage *logoImage = [UIImage imageNamed:@"bicon.png"];
    UIImage *backCircleImage = [UIImage imageNamed:@"light_circle.png"];
    UIImage *frontCircleImage = [UIImage imageNamed:@"dark_circle.png"];

    BMYCircularProgressView *progressView1 = [[BMYCircularProgressView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)
                                                                                      logo:logoImage
                                                                           backCircleImage:backCircleImage
                                                                          frontCircleImage:frontCircleImage];
    __weak typeof(self) weakSelf = self;
    
    [self.tableView setPullToRefreshWithHeight:60.0f actionHandler:^(BMYPullToRefreshView *pullToRefreshView) {
        int64_t delayInSeconds = 1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [weakSelf.tableView.pullToRefreshView stopAnimating];
        });
    }];
    
    [self.tableView.pullToRefreshView setProgressView:progressView1];
}

- (void)_setupTableViewWithContentInset1 {
    UIImage *logoImage = [UIImage imageNamed:@"bicon.png"];
    UIImage *backCircleImage = [UIImage imageNamed:@"light_circle.png"];
    UIImage *frontCircleImage = [UIImage imageNamed:@"dark_circle.png"];
    
    BMYCircularProgressView *progressView2 = [[BMYCircularProgressView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)
                                                                                       logo:logoImage
                                                                            backCircleImage:backCircleImage
                                                                           frontCircleImage:frontCircleImage];
    __weak typeof(self) weakSelf = self;
    
    self.tableViewWithContentInset1.contentInset = UIEdgeInsetsMake(100.0f, 0.0f, 0.0f, 0.0f);
    [self.tableViewWithContentInset1 setPullToRefreshWithHeight:60.0f actionHandler:^(BMYPullToRefreshView *pullToRefreshView) {
        int64_t delayInSeconds = 1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [weakSelf.tableViewWithContentInset1.pullToRefreshView stopAnimating];
        });
    }];
    
    [self.tableViewWithContentInset1.pullToRefreshView setPreserveContentInset:NO];
    [self.tableViewWithContentInset1.pullToRefreshView setProgressView:progressView2];
}

- (void)_setupTableViewWithContentInset2 {
    UIImage *logoImage = [UIImage imageNamed:@"bicon.png"];
    UIImage *backCircleImage = [UIImage imageNamed:@"light_circle.png"];
    UIImage *frontCircleImage = [UIImage imageNamed:@"dark_circle.png"];
    
    BMYCircularProgressView *progressView3 = [[BMYCircularProgressView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)
                                                                                       logo:logoImage
                                                                            backCircleImage:backCircleImage
                                                                           frontCircleImage:frontCircleImage];
    __weak typeof(self) weakSelf = self;
    
    self.tableViewWithContentInset2.contentInset = UIEdgeInsetsMake(100.0f, 0.0f, 0.0f, 0.0f);
    [self.tableViewWithContentInset2 setPullToRefreshWithHeight:60.0f actionHandler:^(BMYPullToRefreshView *pullToRefreshView) {
        int64_t delayInSeconds = 1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [weakSelf.tableViewWithContentInset2.pullToRefreshView stopAnimating];
        });
    }];
    
    [self.tableViewWithContentInset2.pullToRefreshView setPreserveContentInset:YES];
    [self.tableViewWithContentInset2.pullToRefreshView setProgressView:progressView3];
}

- (void)dealloc {
    [self.tableView tearDownPullToRefresh];
    [self.tableViewWithContentInset1 tearDownPullToRefresh];
    [self.tableViewWithContentInset2 tearDownPullToRefresh];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor greenColor];
    }
    
    cell.textLabel.text = NSLocalizedString(@"Pull!", nil);
    return cell;
}

@end
