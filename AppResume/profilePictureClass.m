//
//  profilePictureClass.m
//  AppResume
//
//  Created by Christopher Beauchene on 12/2/14.
//  Copyright (c) 2014 ChrisBeauchene. All rights reserved.
//

#import "profilePictureClass.h"

@implementation profilePictureClass


CGPoint startingTouch;
CGPoint endingTouch;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //Get the coordinates of the initial touch and bring self.view to the front using the superview.
    startingTouch = [[touches anyObject] locationInView:self];
    self.startingOrigin = CGPointMake(self.frame.origin.x, self.frame.origin.y);
    [[self superview] bringSubviewToFront:self];
    NSLog(@"You touched the picture!");
}

- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    
    // Move relative to the original touch point
    CGPoint point = [[touches anyObject] locationInView:self];
    CGRect frame = [self frame];
    frame.origin.x += point.x - startingTouch.x;
    frame.origin.y += point.y - startingTouch.y;
    endingTouch.x = point.x;
    endingTouch.y = point.y;
    [self setFrame: frame];
    NSLog(@"You moved your touch!");
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self movePictureBack];
}

-(void)movePictureBack {
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView animateWithDuration: 0.25 animations:^(void){
        CGRect frame = self.frame;
        frame.origin = self.startingOrigin;
        [self setFrame:frame];
    }];
    NSLog(@"Your touches ended");
}
@end
