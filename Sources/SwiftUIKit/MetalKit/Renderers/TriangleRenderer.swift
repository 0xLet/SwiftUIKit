//
//  Renderer.swift
//  MetalTutoral
//
//  Created by developer on 10/22/19.
//  Copyright © 2019 developer. All rights reserved.
//

import MetalKit

@available(iOS 9.0, *)
public class TriangleRenderer: NSObject {
    public var mesh: MTKMesh?
    public var vertexBuffer: MTLBuffer?
    public var pipelineState: MTLRenderPipelineState?
    
    public var vertexShaderName: String = "vertex_main_moving"
    public var fragmentShaderName: String = "fragment_main"
    var timer: Float = 0
    
    public override init() {
        super.init()
        
        let mdlMesh = getMesh()
        
        do{
            mesh = try MTKMesh(mesh: mdlMesh, device: device)
        } catch let error {
            print(error.localizedDescription)
        }
        
        vertexBuffer = mesh?.vertexBuffers[0].buffer
        
    }
}

@available(iOS 9.0, *)
extension TriangleRenderer: Renderer {
    public func getMesh() -> MDLMesh {
        return Primitive.makeTriangle(device: device, size: 1)
    }
    
    public func load(metalView: MTKView) {
        let path = Bundle.main.path(forResource: "Shaders", ofType: "metal")
        let input = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        let library = try? device.makeLibrary(source: input!, options: nil)
        
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
extension TriangleRenderer: MTKViewDelegate {
    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    
    public func draw(in view: MTKView) {
        draw(metalView: view)
    }
}
