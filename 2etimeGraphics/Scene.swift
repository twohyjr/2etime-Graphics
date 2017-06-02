import MetalKit

class Scene: Node{
    
    var device: MTLDevice!
    var sceneConstants = SceneConstants()
    
    var aspectRatio: Float = 1.0
    
    var light = Light()
    
    init(device: MTLDevice){
        self.device = device
        super.init()
        
    }
    
    override func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float){
        sceneConstants.projectionMatrix = matrix_float4x4(perspectiveDegreesFov: 45, aspectRatio: aspectRatio, nearZ: 0.1, farZ: 100)
        commandEncoder.setVertexBytes(&sceneConstants, length: MemoryLayout<SceneConstants>.stride, at: 2)
        commandEncoder.setFragmentBytes(&light, length: MemoryLayout<Light>.stride, at: 1)
        super.render(commandEncoder: commandEncoder, deltaTime: deltaTime)
    }
    
}
