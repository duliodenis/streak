//
//  Streak.m
//  Streak
//
//  Created by Dulio Denis on 5/6/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import "Streak.h"
#import <Parse/Parse.h>

@implementation Streak

- (void)saveStreak {
    PFObject *streak;
    
    if (!self.objectId) {   // If the Object is new
        streak = [PFObject objectWithClassName:@"Streak"];
        streak[@"name"] = self.name;
    } else {                // otherwise just update the object
        streak = [PFObject objectWithoutDataWithClassName:@"Streak" objectId:self.objectId];
        streak[@"name"] = self.name;
    }
    
    [streak pinInBackground];
    [streak saveEventually];
}

@end
