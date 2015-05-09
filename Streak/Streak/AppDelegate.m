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
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Initialize Fabric with Crashlytics.
    [Fabric with:@[CrashlyticsKit]];
    
    // Initialize Parse.
    [Parse enableLocalDatastore];
    NSDictionary *parse = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Parse"];
    [Parse setApplicationId:parse[@"AppID"]
                  clientKey:parse[@"clientKey"]];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    return YES;
}

@end
