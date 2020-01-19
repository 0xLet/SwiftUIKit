//
//  CustomRenderer.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 1/19/20.
//

import MetalKit

@available(iOS 9.0, *)
class CustomRenderer: NSObject, Renderer {
    // Dummy
    func getMesh() -> MDLMesh {
        return Primitive.makeCube(device: device, size: 1)
    }
    
    var mesh: MTKMesh?
    var vertexBuffer: MTLBuffer?
    var pipelineState: MTLRenderPipelineState?
    var vertexFunction: MTLFunction?
    var fragmentFunction: MTLFunction?
    var clearColor: MTLClearColor?
    var renderMethod: ((MTLRenderCommandEncoder) -> Void)?
    
    internal var vertexShaderName: String = "vertex_main_moving"
    internal var fragmentShaderName: String = "fragment_main"
    var timer: Float = 0
    
    override init() {
        super.init()
    }
    
    func mesh(_ closure: (MTLDevice) -> MDLMesh) -> Self {
        do{
            mesh = try MTKMesh(mesh: closure(device), device: device)
        } catch let error {
            print(error.localizedDescription)
        }
        
        vertexBuffer = mesh?.vertexBuffers[0].buffer
        return self
    }
    
    func vertex(shaderName: () -> String) -> Self {
        let library = device.makeDefaultLibrary()
        vertexFunction = library?.makeFunction(name: shaderName())
        
        return self
    }
    
    func fragment(shaderName: () -> String) -> Self {
        let library = device.makeDefaultLibrary()
        fragmentFunction = library?.makeFunction(name: shaderName())
        
        return self
    }
    
    func clear(color: () -> MTLClearColor) -> Self {
        clearColor = color()
        
        return self
    }
    
    func render(encoder: @escaping (MTLRenderCommandEncoder) -> Void) -> Self {
        renderMethod = encoder
        
        return self
    }
    
    func load(metalView: MTKView) {
        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        
        if let mesh = mesh {
            pipelineDescriptor.vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mesh.vertexDescriptor)
        }
        pipelineDescriptor.colorAttachments[0].pixelFormat = metalView.colorPixelFormat
        do {
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
        // Protocol
        if let color = clearColor {
            metalView.clearColor = color
        }
        metalView.delegate = self
    }
    
    func configure(renderEncoder: MTLRenderCommandEncoder) -> MTLRenderCommandEncoder? {
       //pipeline state
        guard let pipelineState = pipelineState,
            let mesh = mesh else {
                return nil
        }
        //pre-processing
        timer += 0.05
        var currentTime = sin(timer)
        var al = abs(currentTime)
        
        //render encoder init
        renderEncoder.setVertexBytes(&currentTime,
                                     length: MemoryLayout<Float>.stride,
                                     index: 1)
        renderEncoder.setFragmentBytes(&al,
                                       length: MemoryLayout<Float>.stride,
                                       index: 0)
        
        renderEncoder.setRenderPipelineState(pipelineState)
        renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        
        for submesh in mesh.submeshes {
            renderEncoder.drawIndexedPrimitives(type: .triangle,
                                                indexCount: submesh.indexCount,
                                                indexType: submesh.indexType,
                                                indexBuffer: submesh.indexBuffer.buffer,
                                                indexBufferOffset: submesh.indexBuffer.offset)
            
        }
        
        return renderEncoder
    }
}

@available(iOS 9.0, *)
extension CustomRenderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {

    }


    func draw(in view: MTKView) {
        draw(metalView: view)
    }
}
