//
//  AddStreakViewController.m
//  Streak
//
//  Created by Dulio Denis on 5/7/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import "AddStreakViewController.h"
#import "Streak.h"

@interface AddStreakViewController ()
@property (weak, nonatomic) IBOutlet UITextField *streakNameTextField;

@end

@implementation AddStreakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)save:(id)sender {
    Streak *streak = [[Streak alloc] init];
    streak.name = self.streakNameTextField.text;
    [streak saveStreak];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
