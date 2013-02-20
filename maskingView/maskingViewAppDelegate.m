//
//  maskingViewAppDelegate.m
//  maskingView
//
//  Created by Crooke Jon on 23/07/2011.
//  Copyright 2011 jBSoft. All rights reserved.
//

#import "maskingViewAppDelegate.h"
#import "ViewControllers.h"

@implementation maskingViewAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
//  UIViewController *vc1 = [[[MaskingViewController alloc] initWithNibName:@"ViewControllers" bundle:nil] autorelease];
//  UIViewController *vc2 = [[[AlphaViewController alloc] initWithNibName:@"ViewControllers" bundle:nil] autorelease];
//  UIViewController *vc3 = [[[CoreImageViewController alloc] initWithNibName:@"ViewControllers" bundle:nil] autorelease];
//  self.tabBarController = [[[UITabBarController alloc] init] autorelease];
//  self.tabBarController.viewControllers = [NSArray arrayWithObjects:vc1, vc2, vc3, nil];
//  self.window.rootViewController = self.tabBarController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
