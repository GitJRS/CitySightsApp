//
//  OnboardingView.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/10/24.
//

import SwiftUI

struct OnboardingView: View {
  
  @Environment(\.dismiss) var dismiss
  @State var selectedViewIndex = 0
  
  // page 1
  var headline: String = "Welcome to City Sights!"
  var subHead: String = "City Sights helps you find the best of the city!"
  
  // page 2
  var headline2: String = "Discover your city"
  var subHead2: String = "We'll show you restaurants, venues, and more, based on your location."
  
  var backgroundColor: Color = Color(hex: "6F9ABD")
  var backgroundColor2: Color = Color(hex: "7B9631")

  var body: some View {
    
    ZStack {
      
      if selectedViewIndex == 0 {
        backgroundColor
      }
      else {
        backgroundColor2
      }
      
      TabView (selection: $selectedViewIndex) {
        
        OnboardingViewDetails(bgColor: backgroundColor,
                              headline: headline,
                              subHeadline: subHead,
                              headGradientTop: .yellow,
                              headGradientBottom: .white) {
          withAnimation {
            selectedViewIndex = 1
          }
        }
                              .tag(0)
                              .ignoresSafeArea()
        
        OnboardingViewDetails(bgColor: backgroundColor2,
                              headline: headline2,
                              subHeadline: subHead2,
                              headGradientTop: Color(hex: "EEBB77"),
                              headGradientBottom: Color(hex: "FFFFFF")) {
          dismiss()
        }
                              .tag(1)
                              .ignoresSafeArea()
      }
//      .tabViewStyle(.page)
      .tabViewStyle(.page(indexDisplayMode: .never))

      VStack {
        
        Spacer()
        
        HStack (spacing: 16) {
          Spacer()
          Circle()
            .frame(width: 10)
            .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
          Circle()
            .frame(width: 10)
            .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
          Spacer()
        }
        .padding(.bottom, 205)
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
  OnboardingView()
}
