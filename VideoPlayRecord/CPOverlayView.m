//
//  CPOverlayView.m
//  VideoPlayRecord
//
//  Created by mondousage on 2/24/14.
//  Copyright (c) 2014 MondoLabs. All rights reserved.
//

#import "CPOverlayView.h"

@implementation CPOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //clear the background color of the overlay
        self.opaque = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.alpha = .5;
        
        
        //add a simple button to the overview
        //with no functionality at the moment
        UIButton *button = [UIButton
                            buttonWithType:UIButtonTypeRoundedRect];
        
        [button setTitle:@"Take Photo" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 320, 40);
        [self addSubview:button];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
