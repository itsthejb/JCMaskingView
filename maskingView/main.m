//
//  main.m
//  maskingView
//
//  Created by Crooke Jon on 23/07/2011.
//  Copyright 2011 jBSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "maskingViewAppDelegate.h"

int main(int argc, char *argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  int ret = UIApplicationMain(argc, argv, nil, NSStringFromClass([maskingViewAppDelegate class]));
  [pool drain];
  return ret;
}
