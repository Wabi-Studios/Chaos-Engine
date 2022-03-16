/**
 * Chaos Engine | Apple Metal Viewer
 *
 * Copyright (C) 2022 Wabi Animation. All Rights Reserved.
 */

import SwiftUI
import MetalKit

struct ContentView: View
{
  var body: some View
  {
    VStack (alignment: .center, spacing: 20) {
      HStack {
        Text("Chaos Engine")
          .padding(.top, 5)
          .padding(.bottom, -15)
          .padding(.leading)
        Spacer()
      }
      MetalView()
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
