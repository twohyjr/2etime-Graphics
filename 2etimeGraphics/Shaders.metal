#include <metal_stdlib>
using namespace metal;

struct VertexIn{
    float4 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct VertexOut{
    float4 position [[ position ]];
    float4 color;
};

struct ModelConstants{
    float4x4 modelMatrix;
};

vertex VertexOut basic_vertex_function(const VertexIn vIn [[ stage_in ]],
                                       constant ModelConstants &modelConstants [[ buffer(1) ]]){
    VertexOut vOut;
    vOut.position =  modelConstants.modelMatrix * vIn.position;
    vOut.color = vIn.color;
    return vOut;
}

fragment float4 basic_fragment_function(VertexOut vIn [[ stage_in ]]){
    return vIn.color;
}

