//
//  FaceView.h
//  Happiness
//
//  Created by Mike Goodspeed on 5/15/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;

@protocol FaceViewDelegate

- (float)smileForFaceView:(FaceView *)requester; // -1 (frown) to 1 (smile)

@end

@interface FaceView : UIView {
    id <FaceViewDelegate> delegate_;
}

@property (assign) id <FaceViewDelegate> delegate;

@end
