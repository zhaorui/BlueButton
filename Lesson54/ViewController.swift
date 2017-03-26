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
    @IBOutlet weak var yellow_button: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blue_button.title = "Button"
        
        //set below to true, yellow cell won't draw the frame
        yellow_button.showsBorderOnlyWhileMouseInside = true;
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

