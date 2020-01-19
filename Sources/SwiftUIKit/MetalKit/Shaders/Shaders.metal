//
//  Shaders.metal
//  MetalTutoral
//
//  Created by developer on 10/22/19.
//  Copyright © 2019 developer. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

// Describes vertex attributes that match the descriptor
struct VertexIn {
    float4 position [[attribute(0)]];
};

// Implement a vertex shader that returns the vertices passed in as a float4
vertex float4 vertex_main_moving(const VertexIn vertexIn [[stage_in]], constant float &timer [[ buffer(1) ]]) {
    float4 position = vertexIn.position;
    position.x *= cos(timer);
    position.y *= sin(timer);
    return position;
}

vertex float4 vertex_main(const VertexIn vertexIn [[stage_in]]) {
    float4 position = vertexIn.position;
    return position;
}

fragment float4 fragment_main() {
    return float4(1, 0, 0, 1);
}

fragment float4 fragment_main_test() {
    return float4(1, 1, 0, 1);
}

//fragment float4 fragment_main_change(VertexOut in [[stage_in]]) {
//    return float4(in.normal, 1);
//}
