//
//  AppDelegate.m
//  Split
//
//  Created by Jeffrey Camealy on 6/27/13.
//  Copyright (c) 2013 orainteractive. All rights reserved.
//

#import "AppDelegate.h"
#import "BMVertSplitVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupWindow];
    [self setupSplitVC];
    return YES;
}

- (void)setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

- (void)setupSplitVC {
    UIViewController *backVC = UIViewController.new;
    backVC.view.backgroundColor = UIColor.greenColor;
    
    UIViewController *frontVC = UIViewController.new;
    frontVC.view.backgroundColor = UIColor.blueColor;
    
    BMVertSplitVC *splitVC = [BMVertSplitVC.alloc initWithBackVC:backVC frontVC:frontVC];
    

    
    self.window.rootViewController = splitVC;
}

@end
