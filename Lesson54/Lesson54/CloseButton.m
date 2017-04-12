//
//  CloseButton.m
//  Lesson54
//
//  Created by 赵睿 on 26/03/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

#import "CloseButton.h"


@implementation CloseButton {
    
    // good strong weak demo!
    __strong CALayer * bg_layer;
    __strong CALayer *  x_layer;
    NSImage * x_img; //in ARC pointer is strong by default, in MRC it's weak by default
}

// we init image in |viewDidMoveToWindow| since the button might be init from xib or strory board
//-(instancetype)initWithFrame:(NSRect)frameRect {
//    
//    if (self = [super initWithFrame:frameRect] ) {
//        
//    }
//    return self;
//}

-(BOOL)wantsUpdateLayer {
    return YES;
}

// Notes: this method should not call super
-(void)updateLayer {
    
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
}

-(void)mouseEntered:(NSEvent *)event {
    NSLog(@"entered");
    bg_layer.hidden = NO;
}

-(void)mouseExited:(NSEvent *)event {
    NSLog(@"out");
    bg_layer.hidden = YES;
}

-(void)viewDidMoveToWindow {
    
    [self addTrackingRect:self.bounds owner:self userData:nil assumeInside:NO];
    
    x_img = [[NSImage alloc] initWithSize:NSMakeSize(100, 100)];
    [x_img lockFocus];
    
    //we need strong reference for this, since in ARC, |path| will be autorelase
    NSBezierPath * path = [[NSBezierPath alloc] init];
    [[NSColor whiteColor] set];
    [path moveToPoint:NSMakePoint(0, x_img.size.height)];
    [path lineToPoint:NSMakePoint(x_img.size.width, 0)];
    [path moveToPoint:NSMakePoint(0, 0)];
    [path lineToPoint:NSMakePoint(x_img.size.width, x_img.size.height)];
    [path setLineWidth:10.0];
    [path stroke];
    [x_img unlockFocus];
    
    
    bg_layer = [[CALayer alloc] init];
    CGFloat minEdge = MIN(self.bounds.size.width, self.bounds.size.height);
    bg_layer.frame = NSMakeRect(NSMidX(self.bounds) - minEdge/2, NSMidY(self.bounds) - minEdge/2, minEdge, minEdge);
    bg_layer.contentsScale = 2;
    bg_layer.backgroundColor = [[[NSColor grayColor] colorWithAlphaComponent:0.8] CGColor];
    bg_layer.cornerRadius = minEdge / 2 ;
    bg_layer.hidden = YES;
    [self.layer addSublayer:bg_layer];
    
    x_layer = [[CALayer alloc] init];
    x_layer.frame = CGRectInset(bg_layer.frame, 0.2 * NSWidth(bg_layer.frame), 0.2*NSHeight(bg_layer.frame));
    x_layer.contents = x_img;
    [self.layer addSublayer:x_layer];
    
}

@end
