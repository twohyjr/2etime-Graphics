import MetalKit

class Model: Node{
    
    var vertexFunctionName: String = "basic_vertex_function"
    var fragmentFunctionName: String = "basic_fragment_function"
    
    var renderPipelineState: MTLRenderPipelineState!
    
    var meshes: [AnyObject]?
    
    var modelConstants = ModelConstants()
    
    var texture: MTLTexture?
    
    var vertexDescriptor: MTLVertexDescriptor{
        let vertexDescriptor = MTLVertexDescriptor()
        
        //Position
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].offset = 0
        
        //Color
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].offset = MemoryLayout<float3>.size
        
        //Texture Coordinates
        vertexDescriptor.attributes[2].bufferIndex = 0
        vertexDescriptor.attributes[2].format = .float2
        vertexDescriptor.attributes[2].offset = MemoryLayout<float3>.size + MemoryLayout<float4>.size
        
        vertexDescriptor.layouts[0].stride = MemoryLayout<Vertex>.stride
        
        return vertexDescriptor
    }
    
    
    init(device: MTLDevice, modelName: String, imageName: String){
        super.init()
        buildModelMeshes(device: device, modelName: modelName)
        
        if(imageName != ""){
            texture = setTexture(device: device, imageName: imageName)
            fragmentFunctionName = "textured_fragment_function"
        }
        
        renderPipelineState = buildPipelineState(device: device)
    }
    
    func buildModelMeshes(device: MTLDevice, modelName: String){
        let assetURL = Bundle.main.url(forResource: modelName, withExtension: "obj")
        
        let assetVertexDescriptor = MTKModelIOVertexDescriptorFromMetal(vertexDescriptor)
        
        let position = assetVertexDescriptor.attributes[0] as! MDLVertexAttribute
        position.name = MDLVertexAttributePosition
        assetVertexDescriptor.attributes[0] = position
        
        let color = assetVertexDescriptor.attributes[1] as! MDLVertexAttribute
        color.name = MDLVertexAttributePosition
        assetVertexDescriptor.attributes[1] = color
        
        let textureCoordiantes = assetVertexDescriptor.attributes[2] as! MDLVertexAttribute
        textureCoordiantes.name = MDLVertexAttributePosition
        assetVertexDescriptor.attributes[2] = textureCoordiantes
        
        let bufferAllocator = MTKMeshBufferAllocator(device: device)
        let asset = MDLAsset(url: assetURL!, vertexDescriptor: assetVertexDescriptor, bufferAllocator: bufferAllocator)
        
        do{
            meshes = try MTKMesh.newMeshes(from: asset, device: device, sourceMeshes: nil)
        }catch let error as NSError{
            print(error)
        }
    }
}

extension Model: Renderable{
    func draw(commandEncoder: MTLRenderCommandEncoder, modelViewMatrix: matrix_float4x4) {
        commandEncoder.setRenderPipelineState(renderPipelineState)
        
        modelConstants.modelViewMatrix = modelViewMatrix
        commandEncoder.setVertexBytes(&modelConstants, length: MemoryLayout<ModelConstants>.stride, at: 1)
        
        if(texture != nil){
            commandEncoder.setFragmentTexture(texture, at: 0)
        }
        
        guard let meshes = self.meshes as? [MTKMesh], meshes.count > 0 else { return }
        
        for mesh in meshes{
            let vertexBuffer = mesh.vertexBuffers[0].buffer
            commandEncoder.setVertexBuffer(vertexBuffer, offset: 0, at: 0)
            
            for submesh in mesh.submeshes{
                commandEncoder.drawIndexedPrimitives(type: submesh.primitiveType,
                                                     indexCount: submesh.indexCount,
                                                     indexType: submesh.indexType,
                                                     indexBuffer: submesh.indexBuffer.buffer,
                                                     indexBufferOffset: submesh.indexBuffer.offset)
            }
        }
        
        
    }
}

extension Model: Texturable{  }
