//
//  YellowButtonCell.m
//  Lesson54
//
//  Created by 赵睿 on 25/03/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

#import "YellowButtonCell.h"

@implementation YellowButtonCell

-(NSString *)alternateTitle {
    return @"Alternate State";
}

-(NSString *)title {
    return @"title";
}

-(void)mouseExited:(NSEvent *)event {
    NSLog(@"cell exited");
    [super mouseExited:event];
}

-(void)mouseEntered:(NSEvent *)event {
    NSLog(@"cell entered");
    [super mouseEntered:event];
}

-(void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView {
    
    if ([self isHighlighted]) {
        [[[[NSColor yellowColor] colorWithAlphaComponent:0.8] shadowWithLevel:0.5]set];
    } else {
        [[NSColor yellowColor] set];
    }
    [[NSBezierPath bezierPathWithOvalInRect:frame] fill];
}


-(NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView {
    
    CGRect target_rect = CGRectOffset(frame, 0, 0);
    
    [[NSColor greenColor] set];
    [[NSBezierPath bezierPathWithRect:target_rect] stroke];
    [title drawInRect:target_rect];
    
    [[NSColor redColor] set];
    [[NSBezierPath bezierPathWithRect:controlView.bounds] stroke];
    
    
    return target_rect;
}

@end
