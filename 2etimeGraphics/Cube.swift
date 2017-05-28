import MetalKit

class Cube: Primitive{

    override func buildVertices(){
        
        vertices = [
            Vertex(position: float3(-1,  1,  1), color: float4(1,0,0,1)),        //v0
            Vertex(position: float3(-1, -1,  1), color: float4(0,1,0,1)),        //v1
            Vertex(position: float3( 1,  1,  1), color: float4(0,0,1,1)),        //v2
            Vertex(position: float3( 1, -1,  1), color: float4(1,1,0,1)),        //v3
            Vertex(position: float3(-1,  1, -1), color: float4(0,1,1,1)),        //v4
            Vertex(position: float3( 1,  1, -1), color: float4(1,0.5,0.5,1)),    //v5
            Vertex(position: float3(-1, -1, -1), color: float4(0.5,1,0,1)),      //v6
            Vertex(position: float3( 1, -1, -1), color: float4(1,0,0.5,1)),      //v7
        ]
        
        indices = [
            //Triangle1     //Triangle2
            0,1,2,          2,1,3,  //Front
            5,2,3,          5,3,7,  //Right
            0,2,4,          2,5,4,  //Top
            0,1,4,          4,1,6, //Left
            5,4,6,          5,6,7,  //Back
            3,1,6,          3,6,7  //Bottom
        ]
    }
    
}
