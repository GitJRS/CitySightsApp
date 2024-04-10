//
//  HomeView.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/7/24.
//

import SwiftUI

struct HomeView: View {
  
  @Environment(BusinessModel.self) var model
  @State var selectedTab = 0
  
  var body: some View {
    
    @Bindable var model = model
    
    VStack {
      HStack {
        
        TextField("What do you seek?", text: $model.query)
        
        Button {
          // todo: implement query
        } label: {
          Text("Go")
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
      }
      // show picker
      Picker("", selection: $selectedTab) {
        
        Text("List")
          .tag(0)
        
        Text("Map")
          .tag(1)
      }
      .pickerStyle(SegmentedPickerStyle())
      
      // show map or list
      if selectedTab == 1 {
        MapView()
      } else {
        ListView()
      }
    }
    .onAppear {
      model.getBusinesses()
    }
    .sheet(item: $model.selectedBusiness) { item in
      BusinessDetailView()
    }
  }
}

#Preview {
  HomeView()
    .environment(BusinessModel())
}
