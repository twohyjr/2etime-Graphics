import MetalKit

protocol Renderable {
    var renderPipelineState: MTLRenderPipelineState! { get set }
    var vertexDescriptor: MTLVertexDescriptor { get }
    
    var vertexFunctionName: String { get set }
    var fragmentFunctionName: String { get set }

    func draw(commandEncoder: MTLRenderCommandEncoder, modelViewMatrix: matrix_float4x4) 
}

extension Renderable{
    func buildPipelineState(device: MTLDevice)->MTLRenderPipelineState{
        let library = device.newDefaultLibrary()
        let vertexFunction = library?.makeFunction(name: vertexFunctionName)
        let fragmentFunction = library?.makeFunction(name: fragmentFunctionName)
        
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        renderPipelineDescriptor.depthAttachmentPixelFormat = .depth32Float
        renderPipelineDescriptor.vertexFunction = vertexFunction
        renderPipelineDescriptor.fragmentFunction = fragmentFunction
        renderPipelineDescriptor.vertexDescriptor = vertexDescriptor
        
        var renderPipelineState: MTLRenderPipelineState! = nil
        do{
            renderPipelineState = try device.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
        }catch let error as NSError{
            Swift.print("\(error)")
        }
        return renderPipelineState
    }
}

