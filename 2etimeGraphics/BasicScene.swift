import MetalKit

class BasicScene: Scene{
    
    let c: Cube!
    override init(device: MTLDevice){
        c = Cube(device: device) //red
        super.init(device: device)
        
        c.translate(direction: float3(0,0,-4))
        c.scale(axis: float3(0.8))

        add(child: c)
    }
    
    override func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float){
        c.rotate(angle: deltaTime, axis: float3(1,0,0))
        c.rotate(angle: deltaTime, axis: float3(0,1,0))
        super.render(commandEncoder: commandEncoder, deltaTime: deltaTime)
    }
    
}
