import MetalKit

class Camera: Node{
    
    var fov: Float = 45
    var aspectRatio: Float = 1
    var nearZ: Float = 0.1
    var farZ: Float = 100
    
    var viewMatrix:matrix_float4x4{
        return modelMatrix
    }
    
    var projectionMatrix:matrix_float4x4{
        return matrix_float4x4(perspectiveDegreesFov: fov, aspectRatio: aspectRatio, nearZ: nearZ, farZ: farZ)
    }
    
}
