import MetalKit

class MetalView: MTKView {

    var renderer: Renderer!
    
    static var mousePosition = float2(0,0)
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        
        self.colorPixelFormat = .bgra8Unorm
        
        self.depthStencilPixelFormat = .depth32Float
        
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
    
}
