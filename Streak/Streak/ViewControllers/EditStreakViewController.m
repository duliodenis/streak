//
//  EditStreakViewController.m
//  Streak
//
//  Created by Dulio Denis on 5/13/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import "EditStreakViewController.h"

@interface EditStreakViewController ()
@property (weak, nonatomic) IBOutlet UITextField *streakNameTextField;
@end

@implementation EditStreakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.streakNameTextField.text = self.streak.name;
}

- (IBAction)save:(id)sender {
    Streak *streak = [[Streak alloc] init];
    streak.name = self.streakNameTextField.text;
    streak.objectId = self.streak.objectId;
    NSLog(@"objectId = %@", streak.objectId);
    [streak saveStreak];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
