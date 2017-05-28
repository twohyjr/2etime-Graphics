import MetalKit

class Node{
    
    var children: [Node] = [  ]
    
    func add(child: Node){
        children.append(child)
    }
    
    func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float){
        for child in children{
            child.render(commandEncoder: commandEncoder,deltaTime: deltaTime)
        }
    }
    
}
