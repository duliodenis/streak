//
//  AppDelegate.m
//  Streak
//
//  Created by Dulio Denis on 5/5/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Fabric with:@[CrashlyticsKit]];
    return YES;
}

@end
