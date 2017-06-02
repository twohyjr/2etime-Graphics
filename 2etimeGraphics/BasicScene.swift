import MetalKit

class BasicScene: Scene{
    
    let c: Cube!
    override init(device: MTLDevice){
        c = Cube(device: device) //red
        super.init(device: device)
        c.position.z = -5
        
        add(child: c)
    }
    
    override func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float){
        c.rotation.x += deltaTime
        c.rotation.y += deltaTime
        super.render(commandEncoder: commandEncoder, deltaTime: deltaTime)
    }
    
}
