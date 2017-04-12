//
//  YYWButtonCell.h
//  buttoncell
//
//  Created by 赵睿 on 12/4/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import <Cocoa/Cocoa.h>

IB_DESIGNABLE
@interface YYWButtonCell : NSButtonCell

@property (assign, nonatomic) IBInspectable BOOL trackHover;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;

@property (retain, nonatomic) IBInspectable NSColor * textEnableColor;
@property (retain, nonatomic) IBInspectable NSColor * textDisableColor;
@property (retain, nonatomic) IBInspectable NSColor * borderColor;
@property (retain, nonatomic) IBInspectable NSColor * hoverColor;
@property (retain, nonatomic) IBInspectable NSColor * clickColor;
@property (retain, nonatomic) IBInspectable NSColor * normalColor;
@property (retain, nonatomic) IBInspectable NSColor * disableColor;

@end
