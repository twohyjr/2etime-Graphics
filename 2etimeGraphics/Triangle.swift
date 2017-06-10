import MetalKit

class Triangle: Primitive{
    var color: float4!
    
    init(device: MTLDevice, color: float4){
        self.color = color
        super.init(device: device, imageName: "")
    }
    
    override func buildVertices(){
        
//        vertices = [
//            Vertex(position: float3( 0,  1, 0), color: color), //v0
//            Vertex(position: float3(-1, -1, 0), color: color), //v1
//            Vertex(position: float3( 1, -1, 0), color: color) //v2
//        ]
//        
//        indices = [
//            0, 1, 2
//        ]
    }
    
}
