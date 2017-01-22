//
//  ViewController.swift
//  Lesson54
//
//  Created by 赵睿 on 21/01/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var blue_button: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let blue_image = NSImage(size: NSSize(width: 30, height: 10), flipped: false) { rect in
            NSColor.blue.setFill()
            NSBezierPath(rect: rect).fill()
            return true
        }
        blue_button.title = "Button"
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

