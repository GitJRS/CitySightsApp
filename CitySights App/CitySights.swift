//
//  CitySights.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/7/24.
//

import SwiftUI

@main
struct CitySights: App {
  
  @State var model = BusinessModel()  // create new BusinessModel instance which stores the list of businesses to be displayed
  @AppStorage("onboarding") var needsOnboarding = true
  
  var body: some Scene {
    
    WindowGroup {
      HomeView()
        .environment(model)  // attach as environment object to root view
        .fullScreenCover(isPresented: $needsOnboarding) {
          // on dismiss
          needsOnboarding = false
        } content: {
          OnboardingView()
            .environment(model)
        }
    }
  }
}
