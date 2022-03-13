//
//  Notifier.swift
//  ChaosEngine
//
//  Created by Tyler Furby on 3/13/22.
//

import MetalKit

class ChaosNotifier
{
  func GPUPing(device: MTLDevice, ping: MTLDeviceNotificationName)
  {
    print("CHAOS: FOUND GPU: " + device.name)
  }
}

