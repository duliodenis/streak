//
//  Streak.h
//  Streak
//
//  Created by Dulio Denis on 5/6/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Streak : NSObject
@property (nonatomic) NSString *objectId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSDate *date;
@property (nonatomic) NSInteger type;
@property (nonatomic) NSInteger status;

- (void)saveStreak;

@end
