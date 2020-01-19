//
//  Renderer.swift
//  MetalTutoral
//
//  Created by developer on 10/22/19.
//  Copyright © 2019 developer. All rights reserved.
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
    
    var vertexShaderName: String { get }
    var fragmentShaderName: String { get }
    
    func getMesh() -> MDLMesh
    func load(metalView: MTKView)
    func configure(renderEncoder: MTLRenderCommandEncoder) -> MTLRenderCommandEncoder?
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
       
        guard let drawable = view.currentDrawable else {
            return
        }
        
        //Present and commit the drawable texture to the GPU
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
