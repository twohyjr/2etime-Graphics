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
    
    @IBOutlet weak var chkWireFrame: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        MainMetalView.toggleWireFrame(wireFrameOn: Bool(chkWireFrame.state as NSNumber))
    }
    
    @IBAction func chkWireFrame_Clicked(_ sender: Any) {
        MainMetalView.toggleWireFrame(wireFrameOn: Bool(chkWireFrame.state as NSNumber))
    }
}
