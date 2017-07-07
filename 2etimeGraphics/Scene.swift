import MetalKit

class Scene: Node{
    
    var device: MTLDevice!
    var sceneConstants = SceneConstants()
    
    var camera = Camera()
    
    var light = Light()
    
    init(device: MTLDevice){
        self.device = device
        super.init()
    }
    
    func updateInput(deltaTime: Float) {  }
    
    func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float){
        light.ambientIntensity = Preferences.ambientIntensity
        light.diffuseIntensity = Preferences.diffuseIntensity
        updateInput(deltaTime: deltaTime)
        
        sceneConstants.projectionMatrix = camera.projectionMatrix
        commandEncoder.setVertexBytes(&sceneConstants, length: MemoryLayout<SceneConstants>.stride, at: 2)
        commandEncoder.setFragmentBytes(&light, length: MemoryLayout<Light>.stride, at: 1)
        
        for child in children{
            child.render(commandEncoder: commandEncoder, parentModelMatrix: camera.viewMatrix)
        }
    }
    
}
