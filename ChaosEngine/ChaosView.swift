/**
 * Chaos Engine | Apple Metal Viewer
 *
 * Copyright (C) 2022 Wabi Animation. All Rights Reserved.
 */

import MetalKit

class ChaosView: MTKView
{
  var cmdQueue: MTLCommandQueue!
  var pipelineState: MTLRenderPipelineState!
  var vertexBuffer: MTLBuffer!

  let vertices: [SIMD3<Float>] = [
    SIMD3<Float>( 0,  1, 0),
    SIMD3<Float>(-1, -1, 0),
    SIMD3<Float>( 1, -1, 0)
  ]
  
  required init(frameRect: CGRect, device: MTLDevice?)
  {
    super.init(frame: frameRect, device: device)
    
    self.device = MTLCreateSystemDefaultDevice()
    
    self.clearColor = MTLClearColor(red: 0.43, green: 0.73, blue: 0.35, alpha: 1.0)
    
    self.colorPixelFormat = .bgra8Unorm
    
    self.cmdQueue = device?.makeCommandQueue()
    
    createBuffers()
    
    createPipelineState()
  }
  
  required init(coder: NSCoder)
  {
    fatalError("CHAOS: Does Not Support Initialization From Storyboards")
  }
  
  func createBuffers()
  {
    print("CHAOS: Render Buffer Created")
  }
  
  func createPipelineState()
  {
    print("CHAOS: Render Pipeline Creation")
  }
}


