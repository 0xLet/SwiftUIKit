//
//  DefaultShaders.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 1/19/20.
//

public let defaultShaders = """
#include <metal_stdlib>
using namespace metal;

// Describes vertex attributes that match the descriptor
struct VertexIn {
    float4 position [[attribute(0)]];
};
vertex float4 vertex_main(const VertexIn vertexIn [[stage_in]]) {
    float4 position = vertexIn.position;
    return position;
}

fragment float4 fragment_main() {
    return float4(1, 0, 0, 1);
}
"""
