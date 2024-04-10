//
//  OnboardingViewDetails.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/10/24.
//

import SwiftUI

struct OnboardingViewDetails: View {
  
  var bgColor: Color
  var headline: String
  var subHeadline: String
  var headGradientTop: Color
  var headGradientBottom: Color
  var buttonAction: () -> Void
  
  var body: some View {
    ZStack {
      Color(bgColor)
      
      VStack (spacing: 0) {
        
        Spacer()
        Spacer()
        
        Image("onboarding")
        
        Text(headline)
          .bold()
          .font(Font.system(size: 22))
          .foregroundStyle(
            LinearGradient(colors: [headGradientTop, headGradientBottom], startPoint: .top, endPoint: .bottom)
          )
          .padding(.top, 32)
        
        Text(subHeadline)
          .foregroundStyle(Color.white)
          .padding(.top, 4)
          .padding(.horizontal)
        
        Spacer()
        
        Button {
          buttonAction()
        } label: {
          ZStack {
            RoundedRectangle(cornerRadius: 14)
              .foregroundStyle(Color.white)
              .frame(height: 50)
            Text("Continue")
              .bold()
              .foregroundStyle(.black)
          }
        }
        .padding(.bottom, 115)
        .padding(.horizontal)
      }
    }
  }
}

#Preview {
  OnboardingViewDetails(bgColor: .gray, headline: "Headline", subHeadline: "Sub Headline text Sub Headline text Sub Headline text Sub Headline text", headGradientTop: .yellow, headGradientBottom: .white) {
    // TODO
  }
}
