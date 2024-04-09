//
//  ContentView.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/7/24.
//

import SwiftUI

struct ContentView: View {
  
  @State var query: String = ""
  var dataService = DataService()
  
  var body: some View {
    HStack {
      
      TextField("What do you seek?", text: $query)
      
      Button {
        // todo: implement query
      } label: {
        Text("Go")
          .padding()
          .background(.blue)
          .foregroundColor(.white)
          .cornerRadius(10)
      }
    }
    .padding()
    .task {
      await dataService.businessSearch()
    }
  }
}

#Preview {
  ContentView()
}
