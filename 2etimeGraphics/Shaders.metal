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

struct SceneConstants{
    float4x4 projectionMatrix;
};

struct Light{
    float2 lightPos;
};

vertex VertexOut basic_vertex_function(const VertexIn vIn [[ stage_in ]],
                                       constant ModelConstants &modelConstants [[ buffer(1) ]],
                                       constant SceneConstants &sceneConstants [[ buffer(2) ]]){
    VertexOut vOut;
    vOut.position = sceneConstants.projectionMatrix *  modelConstants.modelMatrix * vIn.position;
    vOut.color = vIn.color;
    return vOut;
}

fragment half4 basic_fragment_function(VertexOut vIn [[ stage_in ]],
                                        constant Light &light [[ buffer(1) ]]){
    
    float intensity = 1 / length(vIn.position.xy - light.lightPos);
    
    float4 color = vIn.color * intensity * 50;
    
    return half4(color.x, color.y, color.z, 1);
}

