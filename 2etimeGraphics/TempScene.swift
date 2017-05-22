import MetalKit

class TempScene: Scene{
    
    override init(device: MTLDevice){
        super.init(device: device)
        add(child: Triangle(device: device, color: float4(1,0,0,1)))
    }
    
}
