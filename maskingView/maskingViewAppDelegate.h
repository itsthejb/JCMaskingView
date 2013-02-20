//
//  maskingViewAppDelegate.h
//  maskingView
//
//  Created by Crooke Jon on 23/07/2011.
//  Copyright 2011 jBSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface maskingViewAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (retain, nonatomic) IBOutlet UIWindow *window;
@property (retain, nonatomic) IBOutlet UITabBarController *tabBarController;

@end
