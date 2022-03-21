/**
 * Chaos Engine | Apple Metal Viewer
 *
 * Copyright (C) 2022 Wabi Animation. All Rights Reserved.
 */

import SwiftUI

@main
struct ChaosEngineApp: App
{
  var body: some Scene
  {
    WindowGroup
    {
      ContentView(actions: cActions())
    }
  }
}
