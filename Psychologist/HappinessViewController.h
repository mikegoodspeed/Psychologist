//
//  HappinessViewController.h
//  Happiness
//
//  Created by Mike Goodspeed on 5/15/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceView.h"

@interface HappinessViewController : UIViewController <FaceViewDelegate>
{
    int happiness_; // 0 to 100
    UISlider *slider_;
    FaceView *faceView_;
}

@property (nonatomic) IBOutlet int happiness;
@property (nonatomic, retain) IBOutlet FaceView *faceView;
@property (nonatomic, retain) IBOutlet UISlider *slider;

- (IBAction)happinessChanged:(UISlider *)sender;

@end
