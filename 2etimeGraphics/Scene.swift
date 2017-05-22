import MetalKit

class Scene: Node{
    
    var device: MTLDevice!
    init(device: MTLDevice){
        self.device = device
        super.init()
    }
    
}
