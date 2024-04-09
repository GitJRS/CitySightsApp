//
//  ContentView.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/7/24.
//

import SwiftUI

struct ContentView: View {
  
  @State var businesses = [Business]()
  @State var query: String = ""
  var dataService = DataService()
  
  var body: some View {
    VStack {
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
      
      List (businesses) { b in
        Text(b.name ?? "Nil")
      }
    }
    .padding()
    .task {
      businesses = await dataService.businessSearch()
    }
  }
}

#Preview {
  ContentView()
}
