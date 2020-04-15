//
//  Primitive.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/22/19.
//

import MetalKit

public class Primitive {
    static func importObj(device: MTLDevice, url: URL, size: Float) -> MTKMesh {
        let allocator = MTKMeshBufferAllocator(device: device)
        
        let vertexDescriptor = MDLVertexDescriptor()
        let vertexLayout = MDLVertexBufferLayout()
        
        vertexLayout.stride = MemoryLayout<Vertex>.stride
        vertexDescriptor.layouts = [vertexLayout]
        vertexDescriptor.attributes = [
            MDLVertexAttribute(name: MDLVertexAttributePosition,
                               format: MDLVertexFormat.float2,
                               offset: 0,
                               bufferIndex: 0),
            MDLVertexAttribute(name: MDLVertexAttributeNormal,
                               format: MDLVertexFormat.float2,
                               offset: MemoryLayout<vector_float2>.stride,
                               bufferIndex: 0)
        ]
        
        var error: NSError?
        let asset = MDLAsset(url: url,
                             vertexDescriptor: vertexDescriptor,
                             bufferAllocator: allocator,
                             preserveTopology: true,
                             error: &error)
        
        if let error = error {
            print(error)
        }
        
        let model = asset.object(at: 0) as! MDLMesh
        var mesh: MTKMesh
        
        do {
            mesh  = try MTKMesh(mesh: model, device: device)
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
        return mesh
    }
    
    static func makeCube(device: MTLDevice, size: Float) -> MDLMesh {
        let allocator = MTKMeshBufferAllocator(device: device)
        let mesh = MDLMesh(boxWithExtent: [size, size, size],
                           segments: [1,1,1],
                           inwardNormals: false,
                           geometryType: .triangles,
                           allocator: allocator)
        return mesh
    }
    
    static func makeTriangle(device: MTLDevice, size: Float) -> MDLMesh {
        let allocator = MTKMeshBufferAllocator(device: device)
        
        //create vertex buffer
        let vertices: [vector_float2] = [vector_float2(0, 0), vector_float2(0.1, 0), vector_float2(0.1,0.1)]
        let vertexBuffer = allocator.newBuffer(MemoryLayout<vector_float2>.stride * vertices.count, type: .vertex)
        let vertexMap = vertexBuffer.map()
        vertexMap.bytes.assumingMemoryBound(to: vector_float2.self).assign(from: vertices, count: vertices.count)
        
        //create index buffer
        let indices: [UInt16] = [UInt16(0), UInt16(1), UInt16(2)]
        let indexBuffer = allocator.newBuffer(MemoryLayout<UInt16>.stride * indices.count, type: .index)
        let indexMap = indexBuffer.map()
        indexMap.bytes.assumingMemoryBound(to: UInt16.self).assign(from: indices, count: indices.count)
        
        let submesh = MDLSubmesh(indexBuffer: indexBuffer,
                                 indexCount: indices.count,
                                 indexType: .uInt16,
                                 geometryType: .points,
                                 material: nil)
        
        
        let vertexDescriptor = MDLVertexDescriptor()
        vertexDescriptor.attributes[0] = MDLVertexAttribute(name: MDLVertexAttributePosition,
                                                            format: .float2,
                                                            offset: 0,
                                                            bufferIndex: 0)
        vertexDescriptor.layouts[0] = MDLVertexBufferLayout(stride: MemoryLayout<vector_float2>.stride)
        
        let mesh = MDLMesh(vertexBuffer: vertexBuffer,
                           vertexCount: vertices.count,
                           descriptor: vertexDescriptor,
                           submeshes: [submesh])
        
        
        return mesh
    }
    
    
}
