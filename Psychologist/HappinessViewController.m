//
//  HappinessViewController.m
//  Happiness
//
//  Created by Mike Goodspeed on 5/15/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "HappinessViewController.h"

@interface HappinessViewController ()
- (void)updateUI;
@end

@implementation HappinessViewController

#pragma mark - Properties

@synthesize happiness;
@synthesize faceView;
@synthesize slider;

- (void)setHappiness:(int)value
{
    if (value < 0)
        value = 0;
	if (value > 100) 
        value = 100;
	happiness = value;
	[self updateUI];
}

#pragma mark - dealloc

- (void)releaseOutlets
{
    self.faceView = nil;
    self.slider = nil;
}

- (void)dealloc
{
    [self releaseOutlets];
    [super dealloc];
}

#pragma mark - Methods

- (void)updateUI
{
	self.slider.value = self.happiness;
	[self.faceView setNeedsDisplay];
}

- (void)happinessChanged:(UISlider *)sender
{
    self.happiness = sender.value;
}

- (float)smileForFaceView:(FaceView *)requester
{
    float smile = 0;
    if (requester == self.faceView)
    {
        smile = (((float)self.happiness - 50) / 50);
    }
    return smile;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.faceView.delegate = self;
    [self updateUI];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self releaseOutlets];
}

@end
