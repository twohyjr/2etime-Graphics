//
//  ViewController.swift
//  2etimeGraphics
//
//  Created by Rick Twohy Jr on 6/1/17.
//  Copyright © 2017 2etime. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var MainMetalView: MetalView!
    @IBOutlet weak var cwClearColorWell: NSColorWell!
    
    @IBOutlet weak var chkWireFrame: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Preferences.setClearColor(color: cwClearColorWell.color)
    }
    
    
    @IBAction func chkWireFrame_Clicked(_ sender: Any) {
        Preferences.useWireFrame = !Preferences.useWireFrame
    }
    
    @IBAction func cwClearColorWell_Changed(_ sender: Any) {
        Preferences.setClearColor(color: cwClearColorWell.color)
    }
}
