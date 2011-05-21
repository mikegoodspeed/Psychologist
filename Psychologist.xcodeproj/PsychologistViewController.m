//
//  PsychologistViewController.m
//  Psychologist
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "PsychologistViewController.h"
#import "HappinessViewController.h"

@interface PsychologistViewController ()
- (void)setDiagnosis:(int)diagnosis;
@end

@implementation PsychologistViewController

- (void)setDiagnosis:(int)diagnosis
{
    HappinessViewController *hvc = [[HappinessViewController alloc] init];
    hvc.happiness = diagnosis;
    hvc.title = [NSString stringWithFormat:@"%d", diagnosis];
    [self.navigationController pushViewController:hvc animated:YES];
    [hvc release];
}

- (IBAction)happy
{
    [self setDiagnosis:100];
}

- (IBAction)soso
{
    [self setDiagnosis:50];
}

- (IBAction)sad
{
    [self setDiagnosis:0];
}

- (void)viewDidLoad
{
    self.title = @"Psychologist";
}

@end
