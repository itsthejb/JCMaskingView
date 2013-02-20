//
//  ViewControllers.h
//  maskingView
//
//  Created by Crooke Jon on 23/07/2011.
//  Copyright 2011 jBSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JCMaskingView;

@interface BaseViewController : UIViewController {
@private
  IBOutlet UIImageView *backgroundImageView;
@protected
  UISlider *slider;
  UIImageView *imageView;
  UILabel *valueLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *valueLabel;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UISlider *slider;
- (IBAction)sliderValueDidChange:(id)sender;
@end

@interface AlphaViewController : BaseViewController
@end

@interface MaskingViewController : BaseViewController {
  JCMaskingView *maskingView;
}
@end
