//
//  Vertex.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/28/19.
//

import MetalKit

public struct Vertex {
    public var vertex: float2
    
    public init(x: Float, y: Float) {
        self.vertex = float2(x, y)
    }
}
