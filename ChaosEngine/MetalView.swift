/**
 * Chaos Engine | Apple Metal Viewer
 *
 * Copyright (C) 2022 Wabi Animation. All Rights Reserved.
 */

import MetalKit
import SwiftUI


final class MetalView : NSViewRepresentable
{
  func makeCoordinator() -> Coordinator
  {
    Coordinator(self)
  }
    
  func makeNSView(context: NSViewRepresentableContext<MetalView>) -> MTKView
  {
    let gpu = MTLCopyAllDevicesWithObserver(handler: ChaosNotifier().GPUPing).devices.first
    let chaosView = ChaosView(frameRect: CGRect(x: 0, y: 0, width: 200, height: 200), device: gpu)
    return chaosView
  }
  
  func updateNSView(_ nsView: MTKView, context: NSViewRepresentableContext<MetalView>)
  {}
  
  class Coordinator : NSObject, MTKViewDelegate
  {
    var parent: MetalView
    var metalDevice: MTLDevice!
    var metalCommandQueue: MTLCommandQueue!
    
    init(_ parent: MetalView)
    {
      self.parent = parent
      self.metalDevice = MTLCopyAllDevicesWithObserver(handler: ChaosNotifier().GPUPing).devices.first
      self.metalCommandQueue = metalDevice.makeCommandQueue()!
      super.init()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize)
    {}
    
    func draw(in view: MTKView)
    {
      guard let drawable = view.currentDrawable else {
        return
      }
      
      let commandBuffer = metalCommandQueue.makeCommandBuffer()
      
      let rpd = view.currentRenderPassDescriptor
      rpd?.colorAttachments[0].clearColor = MTLClearColorMake(0, 1, 0, 1)
      rpd?.colorAttachments[0].loadAction = .clear
      rpd?.colorAttachments[0].storeAction = .store
      
      let re = commandBuffer?.makeRenderCommandEncoder(descriptor: rpd!)
      re?.endEncoding()
      
      commandBuffer?.present(drawable)
      commandBuffer?.commit()
    }
  }
}
