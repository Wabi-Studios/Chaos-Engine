/**
 * Chaos Engine | Apple Metal Viewer
 *
 * Copyright (C) 2022 Wabi Animation. All Rights Reserved.
 */

import Foundation
import GameKit

struct cActions
{
  func File()
  {
    let panel = NSOpenPanel()
    panel.allowsMultipleSelection = false
    panel.canChooseDirectories = false
    // TODO: Save filename
    // if panel.runModal() == .OK {
    //   self.filename = panel.url?.lastPathComponent ?? "<none>"
    // }
  }
  
  func Edit()
  {
    print("Edit()")
  }

  func Render()
  {
    print("Render()")
  }

  func Window()
  {
    print("Window()")
  }

  func Help()
  {
    print("Help()")
  }
}
