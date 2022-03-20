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
  
  let actions: ACT
  
  var body: some View
  {
    MetalView()
      .toolbar {
        ToolbarItemGroup(placement: .navigation) {
          Image(colorScheme == .dark ? "dark" : "light")
            .interpolation(.high)
            .resizable()
            .scaledToFit()
            .frame(width: 24.0, height: 24.0)
            .background(.clear)
            .ignoresSafeArea()
          HStack {
            Button("File",   action: actions.File).padding(.leading, 10)
            Button("Edit",   action: actions.Edit).padding(.leading, 10)
            Button("Render", action: actions.Render).padding(.leading, 10)
            Button("Window", action: actions.Window).padding(.leading, 10)
            Button("Help",   action: actions.Help).padding(.leading, 10)
          }
        }
      }.navigationTitle("").background(.clear)
  }  
}

struct ContentView_Previews: PreviewProvider
{
  static var previews: some View
  {
    ContentView(actions: ACT())
  }
}
