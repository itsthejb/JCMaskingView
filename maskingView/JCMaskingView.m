//
//  JCMaskingView.m
//  mask
//
//  Created by Jon Crooke on 18/06/2011.
//  Copyright 2011 Jon Crooke. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "JCMaskingView.h"

@interface JCMaskingView (Private)
- (void)sharedInit;
@end

@implementation JCMaskingView
@synthesize maskColour, parentView;

#pragma mark -
#pragma mark Init 

- (id)initWithParentView:(UIView *)view {
  if ((self = [super initWithFrame:view.bounds])) {
    self.parentView = view;
    [self sharedInit];
  }
  return self;
}

- (id)initWithFrame:(CGRect)frame { return [self initWithParentView:nil]; }

- (void)awakeFromNib {
  [super awakeFromNib];
  [self sharedInit];
}

- (void)sharedInit {
  self.backgroundColor = [UIColor clearColor];
}

- (void)dealloc {
  [maskColour release];
  [super dealloc];
}

#pragma mark -
#pragma mark Drawing 

- (void)drawRect:(CGRect)rect
{
  UIGraphicsBeginImageContext(self.parentView.bounds.size);
  [self.parentView.layer renderInContext:UIGraphicsGetCurrentContext()];

  CGImageRef parentViewImage = CGImageRetain(UIGraphicsGetImageFromCurrentImageContext().CGImage);
  UIGraphicsEndImageContext();  
  
  NSMutableData *data = [[NSMutableData alloc] initWithLength:90 * 90 * 1];
  CGContextRef context = CGBitmapContextCreate([data mutableBytes], 90, 90, 8, 90, NULL, kCGImageAlphaOnly);
  CGContextSetBlendMode(context, kCGBlendModeCopy);
  CGContextDrawImage(context, CGRectMake(0.0, 0.0, 90.0, 90.0), parentViewImage);
  CGContextRelease(context);
  CGDataProviderRef dataProvider = CGDataProviderCreateWithCFData((CFMutableDataRef)data);
  CGDataProviderRelease(dataProvider);
  [data release];
  
  // Draw the mask to the current context
  
  context = UIGraphicsGetCurrentContext();
  
  CGFloat height = self.bounds.size.height;
  CGContextTranslateCTM(context, 0.0, height);
  CGContextScaleCTM(context, 1.0, -1.0);
  
  CGContextSetFillColorWithColor(context, maskColour.CGColor);
  
  CGContextSaveGState(context);
  CGContextClipToMask(context, self.bounds, parentViewImage);
  CGContextFillRect(context, self.bounds);
  CGContextRestoreGState(context);
  
  CFRelease(parentViewImage);
}

@end
