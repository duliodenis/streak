//
//  ListViewController.m
//  Streak
//
//  Created by Dulio Denis on 5/5/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import "ListViewController.h"
#import "Streak.h"
#import <Parse/Parse.h>
#import <Bolts/Bolts.h>

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *streaks;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [self loadStreaks];
}


- (void)loadStreaks {
    self.streaks = [NSMutableArray array];
    PFQuery *query = [PFQuery queryWithClassName:@"Streak"];
    
    [query fromLocalDatastore];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            for (PFObject *retrievedStreak in objects) {
                Streak *streak = [[Streak alloc] init];
                streak.name = [retrievedStreak objectForKey:@"name"];
                [self.streaks addObject:streak];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
        } else {
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", errorString);
        }
    }];

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
