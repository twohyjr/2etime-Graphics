import MetalKit

class Scene: Node{
    
    var device: MTLDevice!
    var sceneConstants = SceneConstants()
    
    init(device: MTLDevice){
        self.device = device
        super.init()
        sceneConstants.projectionMatrix = matrix_float4x4(perspectiveDegreesFov: 45, aspectRatio: 1, nearZ: 0.1, farZ: 100)
    }
    
    override func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float){
        commandEncoder.setVertexBytes(&sceneConstants, length: MemoryLayout<SceneConstants>.stride, at: 2)
        super.render(commandEncoder: commandEncoder, deltaTime: deltaTime)
    }
    
}
