/**
 * Chaos Engine | Apple Metal Viewer
 *
 * Copyright (C) 2022 Wabi Animation. All Rights Reserved.
 */

import MetalKit

class ChaosView: MTKView
{
  
  struct Vertex
  {
    var position: SIMD3<Float>
    var color: SIMD4<Float>
  }
  
  
  var cmdQueue: MTLCommandQueue!
  var renderPipelineState: MTLRenderPipelineState!
  var vertices: [Vertex]!
  var vertexBuffer: MTLBuffer!
  
  
  required init(frameRect: CGRect, device: MTLDevice?)
  {
    super.init(frame: frameRect, device: device)
    
    self.device = device
    
    self.clearColor = MTLClearColor(red: 0.43, green: 0.73, blue: 0.35, alpha: 1.0)
    
    self.colorPixelFormat = .bgra8Unorm
    
    self.cmdQueue = device?.makeCommandQueue()
    
    CreatePipelineState()
    
    CreateVertices()
    
    CreateBuffers()
  }
  
  
  required init(coder: NSCoder)
  {
    fatalError("CHAOS: Does Not Support Initialization From Storyboards")
  }
  
  
  func CreatePipelineState()
  {
    print("CHAOS: Render Pipeline Creation")
    let library = device?.makeDefaultLibrary()
    let vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
    let fragmentFunction = library?.makeFunction(name: "basic_fragment_shader")
    
    let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
    renderPipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
    renderPipelineDescriptor.vertexFunction = vertexFunction
    renderPipelineDescriptor.fragmentFunction = fragmentFunction
    
    do {
      renderPipelineState = try device?.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
      
    } catch let error as NSError {
      print("CHAOS: CRITICAL FAILURE - COULD NOT CREATE RENDER PIPELINE")
      print(error)
    }
  }
  
  
  func CreateVertices()
  {
    vertices = [
      Vertex(position: SIMD3<Float>( 0, 1,0), color: SIMD4<Float>(1,0,0,1)),
      Vertex(position: SIMD3<Float>(-1,-1,0), color: SIMD4<Float>(0,1,0,1)),
      Vertex(position: SIMD3<Float>( 1,-1,0), color: SIMD4<Float>(0,0,1,1))
    ]
  }
  
  
  func CreateBuffers()
  {
    print("CHAOS: Render Buffer Creation")
    vertexBuffer = device?.makeBuffer(bytes: vertices,
                                      length: MemoryLayout<Vertex>.stride * vertices.count,
                                      options: [])
  }
  
  override func draw(_ dirtyRect: NSRect)
  {
    guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else {
      return
    }
    
    let cmdBuffer = cmdQueue.makeCommandBuffer()
    let renderCmdEncoder = cmdBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
    renderCmdEncoder?.setRenderPipelineState(renderPipelineState)
    
    renderCmdEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
    renderCmdEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
    
    renderCmdEncoder?.endEncoding()
    cmdBuffer?.present(drawable)
    cmdBuffer?.commit()
  }
}
