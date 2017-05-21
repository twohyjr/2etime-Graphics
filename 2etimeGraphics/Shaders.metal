#include <metal_stdlib>
using namespace metal;

struct VertexIn{
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct VertexOut{
    float4 position [[ position ]];
    float4 color;
};

struct Constants{
    float animateBy;
};

vertex VertexOut basic_vertex_function(const VertexIn vIn [[ stage_in ]],
                                       constant Constants &constants [[buffer(1)]]){
    VertexOut vOut;
    vOut.position = float4(vIn.position, 1);
    vOut.position.xy += cos(constants.animateBy);
    vOut.position.y += sin(constants.animateBy);
    vOut.color = vIn.color;
    return vOut;
}

fragment float4 basic_fragment_function(VertexOut vIn [[ stage_in ]]){
    return vIn.color;
}

