import MetalKit

class MetalView: MTKView {

    var renderer: Renderer!
    
    static var mousePosition = float2(0,0)
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        
        self.colorPixelFormat = .bgra8Unorm
        
        self.depthStencilPixelFormat = .depth32Float
        
        //self.clearColor = MTLClearColor(red: 0.25, green: 0.57, blue: 0.39, alpha: 1)
        self.clearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        renderer = Renderer(device: device!)
        
        renderer.updateTrackingArea(view: self)
        
        self.delegate = renderer
    }
    
    override var acceptsFirstResponder: Bool { return true }
    
    
    override func mouseMoved(with event: NSEvent) {
        let x: Float = Float(event.locationInWindow.x)
        let y: Float = Float(event.locationInWindow.y - 50)
        MetalView.mousePosition = float2(x,y)
        
        Swift.print("Mouse Position: \(x), \(y)")
    }
    
    override func keyDown(with event: NSEvent) {
        InputHandler.setKeyPressed(key: event.keyCode, isOn: true)
    }
    
    override func keyUp(with event: NSEvent) {
        InputHandler.setKeyPressed(key: event.keyCode, isOn: false)
    }
    
    public static func getMousePosition()->float2{
        return mousePosition
    }
    
    func toggleWireFrame(wireFrameOn: Bool){
        renderer.toggleWireFrame(wireFrameOn: wireFrameOn)
    }
    
    
}
