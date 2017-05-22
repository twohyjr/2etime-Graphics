import MetalKit

class BasicScene: Scene{
    
    override init(device: MTLDevice){
        super.init(device: device)
        
        let triangle1 = Triangle(device: device, color: float4(1,0,0,1))
        triangle1.scale(axis: float3(0.8))
        
        let triangle2 = Triangle(device: device, color: float4(0,1,0,1))
        triangle2.scale(axis: float3(0.5))
        
        add(child: triangle1)
        add(child: triangle2)
    }
    
}
