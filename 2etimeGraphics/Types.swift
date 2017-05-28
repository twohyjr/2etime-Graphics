import MetalKit

struct Vertex{
    var position: float3
    var color: float4
}

struct ModelConstants{
    var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants{
    var projectionMatrix = matrix_identity_float4x4
}
