import MetalKit

class Node{
    
    var children: [Node] = [  ]
    
    var position = float3(0)
    var rotation = float3(0)
    var scale = float3(1)
    
    var modelMatrix: matrix_float4x4{
        var modelMatrix = matrix_identity_float4x4
        modelMatrix.translate(direction: position)
        modelMatrix.rotate(angle: rotation.x, axis: float3(1,0,0))
        modelMatrix.rotate(angle: rotation.y, axis: float3(0,1,0))
        modelMatrix.rotate(angle: rotation.z, axis: float3(0,0,1))
        modelMatrix.scale(axis: scale)
        return modelMatrix
    }
    
    func add(child: Node){
        children.append(child)
    }
    
    func render(commandEncoder: MTLRenderCommandEncoder, parentModelMatrix: matrix_float4x4){
        for child in children{
            child.render(commandEncoder: commandEncoder,parentModelMatrix: parentModelMatrix)
        }
        let modelViewMatrix:matrix_float4x4 = matrix_multiply(parentModelMatrix, modelMatrix)
        if let renderable = self as? Renderable{
            renderable.draw(commandEncoder: commandEncoder, modelViewMatrix: modelViewMatrix)
        }
    }
    
}
