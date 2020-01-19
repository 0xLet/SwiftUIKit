////
////  MeshRenderer.swift
////  MetalTutoral
////
////  Created by developer on 11/12/19.
////  Copyright © 2019 developer. All rights reserved.
////

import MetalKit

@available(iOS 9.0, *)
class ColorChangeRenderer: NSObject, Renderer {
    var mesh: MTKMesh?
    var vertexBuffer: MTLBuffer?
    var pipelineState: MTLRenderPipelineState?
    
    internal var vertexShaderName: String = "vertex_main"
    internal var fragmentShaderName: String = "fragment_main_change"
    var timer: Float = 0
    
    override init() {
        super.init()
        
        let mdlMesh = getMesh()
        
        do{
            mesh = try MTKMesh(mesh: mdlMesh, device: device)
        } catch let error {
            print(error.localizedDescription)
        }
        
        vertexBuffer = mesh?.vertexBuffers[0].buffer
        
    }
    
    func getMesh() -> MDLMesh {
        return Primitive.makeCube(device: device, size: 1)
    }

    func load(metalView: MTKView) {
        let library = device.makeDefaultLibrary()
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
    
    func configure(renderEncoder: MTLRenderCommandEncoder) -> MTLRenderCommandEncoder? {
           guard let pipelineState = pipelineState,
               let mesh = mesh else {
               return nil
           }
        
            timer += 0.05
            var currentTime = sin(timer)
            var al = abs(currentTime)
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
extension ColorChangeRenderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    
    func draw(in view: MTKView) {
        draw(metalView: view)
    }
}
