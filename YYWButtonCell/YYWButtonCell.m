//
//  YYWButtonCell.m
//  buttoncell
//
//  Created by 赵睿 on 12/4/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "YYWButtonCell.h"

@interface YYWButtonCell ()

@property (assign,nonatomic,getter=isMouseInside) BOOL mouseIn ;

- (void)drawBorderWith:(NSRect)dirtyRect;

@end

@implementation YYWButtonCell

-(void)setTrackHover:(BOOL)trackHover{
    self.showsBorderOnlyWhileMouseInside = trackHover;
    _trackHover = trackHover;
}

-(void)mouseEntered:(NSEvent *)event {
    self.mouseIn = YES;
    [super mouseEntered:event];
}

-(void)mouseExited:(NSEvent *)event {
    self.mouseIn = false;
    [super mouseExited:event];
}



//drawBorderWith:dirtyRect try to resolve deckle edge issue
//while using below method, the corner would get thicker
//[self.borderColor set];
//[path setLineWidth:self.borderWidth];
//[path stroke];
- (void)drawBorderWith:(NSRect)dirtyRect {
    
    CGFloat corner_border_width = self.borderWidth / 2;
    
    CGFloat x = dirtyRect.origin.x + corner_border_width;
    CGFloat y = dirtyRect.origin.y + corner_border_width;
    CGFloat height = dirtyRect.size.height - corner_border_width;
    CGFloat width = dirtyRect.size.width - corner_border_width;
    
    CGFloat radius = self.cornerRadius;
    
    CGContextRef context = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    CGContextAddArc(context, x + radius, y + radius, radius, -M_PI_2, -M_PI, 1);
    CGContextAddArc(context, x + radius, height - radius, radius, M_PI, M_PI_2, 1);
    CGContextAddArc(context, width - radius, height - radius, radius, M_PI_2, 0, 1);
    CGContextAddArc(context, width - radius, y + radius, radius, 0, -M_PI_2, 1);
    CGContextSetLineWidth(context, self.borderWidth);
    CGContextClosePath(context);
    [[NSColor colorWithCalibratedRed:140.0/255 green:140.0/255 blue:140.0/255 alpha:1] setStroke];
    CGContextStrokePath(context);
    
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path moveToPoint:NSMakePoint(0, radius)];
    [path lineToPoint:NSMakePoint(0, height-radius)];
    [path moveToPoint:NSMakePoint(radius, height)];
    [path lineToPoint:NSMakePoint(width-radius, height)];
    [path moveToPoint:NSMakePoint(width, radius)];
    [path lineToPoint:NSMakePoint(width, height-radius)];
    [path moveToPoint:NSMakePoint(radius, 0)];
    [path lineToPoint:NSMakePoint(width-radius, 0)];
    [path stroke];
}


//MARK: - draws the border, relative to |showsBorderOnlyWhileMouseInside|
-(void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView {
    
    //NSLog(@"%@", NSStringFromRect(frame));
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:frame
                                                         xRadius:self.cornerRadius yRadius:self.cornerRadius];
    
    //draw background
    if (self.isMouseInside) {
        //hover
        
        if ([self isHighlighted]) {
            
            //click
            [self.clickColor set];
            [path fill];
            
        } else {
            
            //just hover
            [self.hoverColor set];
            [path fill];
        }
        
    } else {
        //normal
        [self.normalColor set];
        [path fill];

    }
    
    //draw border
    [self drawBorderWith:frame];
}

-(NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView {
    
    if ([self isEnabled]) {
        //enabled, normal mode
        
        //when |trackHover| enabled, if mouse not inside a button, drawBezelWithFrame:inView: won't be called,
        //so the background and boarder won't be drawn. Therefore, we draw them in this method.
        if (self.trackHover && !self.isMouseInside) {
            [self drawBezelWithFrame:[controlView bounds] inView:controlView];
        }
        
        //draw title
        [self.textEnableColor set];
        [title drawInRect:frame];
        
    } else {
        //disabled
        
        NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:[controlView bounds]
                                                             xRadius:self.cornerRadius yRadius:self.cornerRadius];
        
        //draw background
        [self.disableColor set];
        [path fill];
        
        //draw border
        [self drawBorderWith:[controlView bounds]];
        
        //draw title
        [self.textDisableColor set];
        [title drawInRect:frame];
    }
    
    return frame;
}

@end
