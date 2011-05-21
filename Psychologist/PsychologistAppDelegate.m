//
//  PsychologistAppDelegate.m
//  Psychologist
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "PsychologistAppDelegate.h"
#import "PsychologistViewController.h"

@implementation PsychologistAppDelegate

@synthesize window=_window;

- (BOOL)                  application:(UIApplication *)application 
        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UINavigationController *navcon = [[UINavigationController alloc] init];
    PsychologistViewController *pvc = [[PsychologistViewController alloc] init];
    [navcon pushViewController:pvc animated:NO];
    [pvc release];
    [self.window addSubview:navcon.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [[[_window subviews] objectAtIndex:0] release];
    [_window release];
    [super dealloc];
}

@end
