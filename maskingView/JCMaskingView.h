//
//  JCMaskingView.h
//  mask
//
//  Created by Jon Crooke on 18/06/2011.
//  Copyright 2011 Jon Crooke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCMaskingView : UIView

@property (retain) UIColor *maskColour;
@property (assign) UIView *parentView;

- (id)initWithParentView:(UIView*)view;

@end
