import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var MainMetalView: MetalView!
    @IBOutlet weak var cwClearColorWell: NSColorWell!
    @IBOutlet weak var chkWireFrame: NSButton!
    
    @IBOutlet weak var txtAmbientIntensity: NSTextField!
    @IBOutlet weak var txtDiffuseIntensity: NSTextField!
    
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
    
    @IBAction func sliderAmbientIntensity_Changed(_ sender: NSSlider) {
        let value  = sender.floatValue / 100
        txtAmbientIntensity.stringValue = String(format: "%.2f", value)
        Preferences.setAmbientIntensity(ambientIntensity: value)
    }
    
    @IBAction func sliderDiffuseIntensity_Changed(_ sender: NSSlider) {
        let value  = sender.floatValue / 100
        txtDiffuseIntensity.stringValue = String(format: "%.2f", value)
        Preferences.setDiffuseIntensity(diffuseIntensity: value)
    }
    
}
