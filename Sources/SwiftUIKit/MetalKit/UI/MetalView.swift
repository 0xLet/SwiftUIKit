//
//  MetalView.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 1/19/20.
//

import MetalKit

public class MetalView: MTKView {
    private var renderer: Renderer
    
    public init(renderer: Renderer) {
        self.renderer = renderer
        
        super.init(frame: .zero, device: renderer.device)
        
        framebufferOnly = false
        
        self.renderer.load(metalView: self)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
