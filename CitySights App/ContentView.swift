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
  @State var selectedBusiness: Business?
  
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
      
      List {
        ForEach(businesses) { b in
          
          VStack (spacing: 20) {
            HStack (spacing: 0) {
              Image("list-placeholder-image")
                .padding(.trailing, 16)
              VStack (alignment: .leading) {
                Text(b.name ?? "Restaurant")
                  .font(Font.system(size:15))
                  .bold()
                Text(TextHelper.distanceAwayText(meters: b.distance ?? 0))
                  .font(Font.system(size:16))
                  .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))

              }
              Spacer()
              Image("regular_\(b.rating ?? 0)")
            }
            Divider()
          }
          .onTapGesture {
            selectedBusiness = b
          }
        }
        .listRowSeparator(.hidden)
      }
      .listStyle(.plain)
    }
    .task {
      businesses = await dataService.businessSearch()
    }
    .sheet(item: $selectedBusiness) { item in
      BusinessDetailView(business: item)
    }
  }
}

#Preview {
  ContentView()
}
