/**
 * Chaos Engine | Apple Metal Viewer
 *
 * Copyright (C) 2022 Wabi Animation. All Rights Reserved.
 */

import SwiftUI
import MetalKit

struct ContentView: View
{
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View
  {
    MetalView()
      .toolbar {
        ToolbarItemGroup(placement: .navigation) {
          Image(colorScheme == .dark ? "chaos-dark" : "chaos-light")
            .resizable()
            .frame(width: 32.0, height: 32.0)
        }
      }
  }
}

struct ContentView_Previews: PreviewProvider
{
  static var previews: some View
  {
    ContentView()
  }
}
