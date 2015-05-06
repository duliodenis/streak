//
//  ListViewController.m
//  Streak
//
//  Created by Dulio Denis on 5/5/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import "ListViewController.h"
#import "Streak.h"

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *streaks;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Setup some sample streaks for UX Construction
    Streak *streak1 = [[Streak alloc] init];
    streak1.name = @"Github Checkins";
    
    Streak *streak2 = [[Streak alloc] init];
    streak2.name = @"Non shopping days at Amazon";
    
    self.streaks = @[streak1, streak2];
}


#pragma mark - TableView Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.streaks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell) {
        Streak *streak = self.streaks[indexPath.row];
        cell.textLabel.text = streak.name;
    }

    return cell;
}

@end
