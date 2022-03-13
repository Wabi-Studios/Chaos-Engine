/**
 * Chaos Engine | Apple Metal Viewer
 *
 * Copyright (C) 2022 Wabi Animation. All Rights Reserved.
 */

import MetalKit

class ChaosNotifier
{
  func GPUPing(device: MTLDevice, ping: MTLDeviceNotificationName)
  {
    print("CHAOS: FOUND GPU: " + device.name)
  }
}

