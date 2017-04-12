//
//  ViewController.m
//  buttoncell
//
//  Created by 赵睿 on 12/4/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)toggleMainButton:(NSButton *)sender {
    if (sender.state == NSOnState) {
        self.mainButton.enabled = YES;
    } else if (sender.state == NSOffState) {
        self.mainButton.enabled = NO;
    } else {
        //mixed state
    }
}

@end
