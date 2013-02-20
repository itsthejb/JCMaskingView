//
//  ViewControllers.m
//  maskingView
//
//  Created by Crooke Jon on 23/07/2011.
//  Copyright 2011 jBSoft. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewControllers.h"
#import "JCMaskingView.h"

@implementation BaseViewController
@synthesize valueLabel;
@synthesize imageView;
@synthesize slider;

- (void)viewDidUnload {
  [self setSlider:nil];
  [self setImageView:nil];
  [self setValueLabel:nil];
  [backgroundImageView release];
  backgroundImageView = nil;
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  return [self init];
}

- (id)init {
  self = [super initWithNibName:@"ViewControllers" bundle:nil];
  if (self) {
    self.tabBarItem.image = [UIImage imageNamed:@"first.png"];
  }
  return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  return [self init];
}

- (void)dealloc {
  [slider release];
  [imageView release];
  [valueLabel release];
  [backgroundImageView release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  backgroundImageView.layer.borderColor = [UIColor darkGrayColor].CGColor;
  backgroundImageView.layer.borderWidth = 1;
  backgroundImageView.layer.cornerRadius = 10;
  backgroundImageView.layer.masksToBounds = YES;
  [self sliderValueDidChange:self.slider];
}

- (IBAction)sliderValueDidChange:(id)sender {
  self.valueLabel.text = [NSString stringWithFormat:@"%d%%", (int) (self.slider.value * 100)];
}

@end

@implementation AlphaViewController
- (id)init {
  if((self = [super init])) {
    self.title = @"Alpha";    
  }
  return self;
}
- (IBAction)sliderValueDidChange:(id)sender {
  [super sliderValueDidChange:sender];
  imageView.alpha = self.slider.value;
}
@end

@implementation MaskingViewController

- (IBAction)sliderValueDidChange:(id)sender {
  [super sliderValueDidChange:sender];
  maskingView.alpha = self.slider.value;
  [maskingView setNeedsDisplay];
}

- (id)init {
  if((self = [super init])) {
    self.title = @"Masking";
  }
  return self;
}

- (void)viewDidLoad {
  maskingView = [[[JCMaskingView alloc] initWithParentView:self.imageView] autorelease];
  maskingView.maskColour = [UIColor blueColor];
  [self.imageView addSubview:maskingView];
  [super viewDidLoad];
}

@end

