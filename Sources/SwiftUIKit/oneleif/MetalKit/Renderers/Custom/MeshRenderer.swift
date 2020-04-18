//
//  MeshRenderer.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 11/12/19.
//

import MetalKit

@available(iOS 9.0, *)
public class MeshRenderer: NSObject {
    public var mesh: MTKMesh?
    public var vertexBuffer: MTLBuffer?
    public var pipelineState: MTLRenderPipelineState?
    
    public var vertexShaderName: String = "vertex_main"
    public var fragmentShaderName: String = "fragment_main"
    var timer: Float = 0
    
    // TODO: nil for now
    public var computePipelineState: MTLComputePipelineState?
    public var computeShaderName: String?
    public func configure(computeEncoder: MTLComputeCommandEncoder) -> MTLComputeCommandEncoder? {
        return nil
    }
    
    public init(_ mdlMesh: MDLMesh? = nil) {
        super.init()
        
        do {
            mesh = try MTKMesh(mesh: mdlMesh ?? getMesh(), device: device)
        } catch let error {
            print(error.localizedDescription)
        }
        
        vertexBuffer = mesh?.vertexBuffers[0].buffer
        
    }
}

@available(iOS 9.0, *)
extension MeshRenderer: Renderer {
    public func getMesh() -> MDLMesh {
        return Primitive.makeCube(device: device, size: 1)
    }
    
    public func load(metalView: MTKView) {
        let defaultLibrary = try? device.makeLibrary(source: defaultShaders, options: nil)
        let library = device.makeDefaultLibrary() ?? defaultLibrary
        
        let vertexFunction = library?.makeFunction(name: vertexShaderName)
        let fragmentFunction = library?.makeFunction(name: fragmentShaderName)
        
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
        metalView.clearColor = MTLClearColor(red: 1, green: 1, blue: 0.8, alpha: 1)
        metalView.delegate = self
    }
    
    public func configure(renderEncoder: MTLRenderCommandEncoder) -> MTLRenderCommandEncoder? {
        
        guard let pipelineState = pipelineState,
            let mesh = mesh else {
                return nil
        }
        
        timer += 0.05
        var currentTime = sin(timer)
        var al = abs(currentTime)
        
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
extension MeshRenderer: MTKViewDelegate {
    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    public func draw(in view: MTKView) {
        draw(metalView: view)
    }
}
