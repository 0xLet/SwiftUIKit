//
//  Renderer.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/22/19.
//

import MetalKit

public class MetalDevice {
    static var shared: MetalDevice = MetalDevice()
    
    var device: MTLDevice
    var commandQueue: MTLCommandQueue
    
    public init() {
        guard let device = MTLCreateSystemDefaultDevice(),
            let commandQueue = device.makeCommandQueue() else {
            fatalError("GPU not available")
        }
        self.device = device
        self.commandQueue = commandQueue
    }
}

@available(iOS 9.0, *)
public protocol Renderer {
    var device: MTLDevice { get }
    var commandQueue: MTLCommandQueue { get }
    var mesh: MTKMesh? { get set }
    var vertexBuffer: MTLBuffer? { get set }
    var pipelineState: MTLRenderPipelineState? { get set }
    var computePipelineState: MTLComputePipelineState? { get set }
    
    var vertexShaderName: String { get }
    var fragmentShaderName: String { get }
    var computeShaderName: String? { get }
    
    func getMesh() -> MDLMesh
    func load(metalView: MTKView)
    func configure(renderEncoder: MTLRenderCommandEncoder) -> MTLRenderCommandEncoder?
    func configure(computeEncoder: MTLComputeCommandEncoder) -> MTLComputeCommandEncoder?
}

@available(iOS 9.0, *)
public extension Renderer {
    var device: MTLDevice {
        return MetalDevice.shared.device
    }
    
    var commandQueue: MTLCommandQueue {
        return MetalDevice.shared.commandQueue
    }
}

// MARK: MTKViewDelegate
@available(iOS 9.0, *)
public extension Renderer {
    //Called once per frame, regenerate the command buffer
    func draw(metalView view: MTKView) {
        guard let descriptor = view.currentRenderPassDescriptor,
            let commandBuffer = self.commandQueue.makeCommandBuffer(),
            let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor),
            let configuredEncoder = configure(renderEncoder: renderEncoder) else {
            return
        }
        
        //drawing code goes here
        configuredEncoder.endEncoding()
        
        // compute code goes here
        if let cps = computePipelineState,
            let drawable = view.currentDrawable,
            let computeEncoder = commandBuffer.makeComputeCommandEncoder(),
            let configuredComputeEncoder = configure(computeEncoder: computeEncoder) {
            
            configuredComputeEncoder.setComputePipelineState(cps)
            configuredComputeEncoder.setTexture(drawable.texture, index: 0)
            let threadGroupCount = MTLSizeMake(8, 8, 1)
            let threadGroups = MTLSizeMake(drawable.texture.width / threadGroupCount.width, drawable.texture.height / threadGroupCount.height, 1)
            configuredComputeEncoder.dispatchThreadgroups(threadGroups, threadsPerThreadgroup: threadGroupCount)
            configuredComputeEncoder.endEncoding()
        }
       
        guard let drawable = view.currentDrawable else {
            return
        }
        
        //Present and commit the drawable texture to the GPU
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
