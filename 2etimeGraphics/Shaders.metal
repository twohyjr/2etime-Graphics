#include <metal_stdlib>
using namespace metal;

struct VertexIn{
    float4 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
    float2 textCoords [[ attribute(2) ]];
    float3 normal [[ attribute(3) ]];
};

struct VertexOut{
    float4 position [[ position ]];
    float4 color;
    float2 textCoords;
    float3 surfaceNormal;
};

struct ModelConstants{
    float4x4 modelViewMatrix;
    float4 materialColor;
    float3x3 normalMatrix;
};

struct SceneConstants{
    float4x4 projectionMatrix;
};

struct Light{
    float3 color;
    float ambientIntensity;
    float3 direction;
    float diffuseIntensity;
};

vertex VertexOut basic_vertex_function(const VertexIn vIn [[ stage_in ]],
                                       constant ModelConstants &modelConstants [[ buffer(1) ]],
                                       constant SceneConstants &sceneConstants [[ buffer(2) ]]){
    VertexOut vOut;
    
    float4 worldPosition = modelConstants.modelViewMatrix * vIn.position;
    vOut.position = sceneConstants.projectionMatrix *  worldPosition;
    vOut.color = modelConstants.materialColor;
    vOut.textCoords = vIn.textCoords;
    vOut.surfaceNormal = modelConstants.normalMatrix * vIn.normal;
    return vOut;
}

vertex VertexOut instance_vertex_function(const VertexIn vIn [[ stage_in ]],
                                       constant ModelConstants *instances [[ buffer(1) ]],
                                       constant SceneConstants &sceneConstants [[ buffer(2) ]],
                                       uint instanceID [[ instance_id ]]){
    
    ModelConstants modelConstants = instances[instanceID];
    VertexOut vOut;
    vOut.position = sceneConstants.projectionMatrix *  modelConstants.modelViewMatrix * vIn.position;
    vOut.color = vIn.color;
    vOut.textCoords = vIn.textCoords;
    return vOut;
}

fragment half4 basic_fragment_function(VertexOut vIn [[ stage_in ]],
                                        constant Light &light [[ buffer(1) ]]){
    float3 unitNormal = normalize(vIn.surfaceNormal);
    float4 color = vIn.color;
    
    //Ambient Color
    float3 ambientColor = light.color * light.ambientIntensity;
    
    //Diffuse Color
    float diffuseFactor = saturate(-dot(unitNormal, light.direction));
    float3 diffuseColor = light.color * light.diffuseIntensity * diffuseFactor;
    
    color = color * float4(ambientColor + diffuseColor, 1);
    
    return half4(color.x, color.y, color.z, 1);
}

fragment half4 textured_fragment_function(VertexOut vIn [[ stage_in ]],
                                          constant Light &light [[ buffer(1) ]],
                                          sampler sampler2d [[ sampler(0) ]],
                                          texture2d<float> texture [[ texture(0) ]]){
    float4 color = texture.sample(sampler2d, vIn.textCoords);
    
    float3 ambientColor = light.color * light.ambientIntensity;
    
    color = color * float4(ambientColor, 1);
    
    return half4(color.x, color.y, color.z, 1);
}

