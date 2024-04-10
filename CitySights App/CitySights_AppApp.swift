//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/7/24.
//

import SwiftUI

@main
struct CitySights_AppApp: App {
  
  @State var model = BusinessModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(model)
    }
  }
}
