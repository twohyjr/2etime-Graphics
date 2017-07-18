import MetalKit

class Renderer: NSObject{
    
    var commandQueue: MTLCommandQueue!
    
    var depthStencilState: MTLDepthStencilState!
    
    var samplerState: MTLSamplerState!
    
    var scene: Scene!
    
    var wireFrameOn:Bool = false
    
    var mousePosition = float2(0,0)
    
    init(device: MTLDevice){
        super.init()
        commandQueue = device.makeCommandQueue()
        self.scene = TerrainScene(device: device)
        buildDepthStencilState(device: device)
        buildSamplerState(device: device)
    }
    
    func buildDepthStencilState(device: MTLDevice){
        let depthStencilDescriptor = MTLDepthStencilDescriptor()
        depthStencilDescriptor.isDepthWriteEnabled = true
        depthStencilDescriptor.depthCompareFunction = .less
        depthStencilState = device.makeDepthStencilState(descriptor: depthStencilDescriptor)
    }
    
    func buildSamplerState(device: MTLDevice){
        let samplerDescriptor = MTLSamplerDescriptor()
        samplerDescriptor.minFilter = .linear
        samplerDescriptor.magFilter = .linear
        samplerState = device.makeSamplerState(descriptor: samplerDescriptor)
    }
}

extension Renderer: MTKViewDelegate{
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        scene.camera.aspectRatio = Float(Float(view.bounds.width) / Float(view.bounds.height))
        updateTrackingArea(view: view)
    }
    
    func updateTrackingArea(view: MTKView){
        let area = NSTrackingArea(rect: view.bounds, options: [NSTrackingAreaOptions.activeAlways, NSTrackingAreaOptions.mouseMoved, NSTrackingAreaOptions.enabledDuringMouseDrag], owner: view, userInfo: nil)
        view.addTrackingArea(area)
    }
    
    func updateInput(view: MTKView){
        let mousePosition = MetalView.getMousePosition()
        
        //Monitor
        let posX: Float = Float(mousePosition.x)
        let posY: Float = Float(-mousePosition.y) + Float(view.bounds.height)
        
        //Mac
        //let posX:Float = Float(mousePosition.x * 2)
        //let posY:Float = Float((-mousePosition.y * 2) + (Float(view.bounds.height)*2))
        InputHandler.setMousePosition(position: float2(posX, posY))
    }
    
    func draw(in view: MTKView) {
        view.clearColor = Preferences.clearColor
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        commandEncoder.setDepthStencilState(depthStencilState)
        commandEncoder.setFragmentSamplerState(samplerState, at: 0)
        
        if(Preferences.useWireFrame){
            commandEncoder.setTriangleFillMode(.lines)
        }
        
        updateInput(view: view)
        
        let deltaTime = 1 / Float(view.preferredFramesPerSecond)
        scene.render(commandEncoder: commandEncoder, deltaTime: deltaTime)

        commandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
}
