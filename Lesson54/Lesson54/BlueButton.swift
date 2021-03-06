//
//  BlueButton.swift
//  Lesson54
//
//  Created by 赵睿 on 22/01/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class BlueButton: NSButton {

    let button_pressed_img = NSImage(size: NSSize(width: 20, height: 20), flipped: false) { rect in
        NSColor(calibratedRed: 128/255, green: 128/255, blue: 1, alpha: 1).setFill()
        NSBezierPath(roundedRect: rect, xRadius: 5, yRadius: 5).fill()
        return true
    }
    
    let button_img = NSImage(size: NSSize(width: 20, height: 20), flipped: false) { rect in
        NSColor(calibratedRed: 0, green: 0, blue: 1, alpha: 1).setFill()
        NSBezierPath(roundedRect: rect, xRadius: 5, yRadius: 5).fill()
        return true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

    }
    
    override var wantsUpdateLayer: Bool {
        return true
    }
    
    
    override func updateLayer() {
        if self.isHighlighted {
            self.layer?.contents = button_pressed_img.layerContents(forContentsScale: button_pressed_img.recommendedLayerContentsScale(0))
        } else {
            self.layer?.contents = button_img.layerContents(forContentsScale: button_img.recommendedLayerContentsScale(0))
        }
        self.layer?.contentsScale = 2 //My Mac is retina, set it to 2
    }
    
    override func viewDidMoveToWindow() {
        //contentScale works when contentsGravity is kCAGravityCenter
        self.layerContentsRedrawPolicy = .onSetNeedsDisplay
        self.layer?.contentsGravity = kCAGravityResize
        self.layer?.contentsCenter = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
    }
    
}
