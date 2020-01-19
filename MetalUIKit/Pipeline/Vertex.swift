//
//  Vertex.swift
//  MetalTutoral
//
//  Created by developer on 10/28/19.
//  Copyright © 2019 developer. All rights reserved.
//

import MetalKit

struct Vertex {
    var vertex: float2
    
    init(x: Float, y: Float) {
        self.vertex = float2(x, y)
    }
}
