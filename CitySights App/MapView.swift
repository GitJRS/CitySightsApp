//
//  MapView.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/9/24.
//

import SwiftUI
import MapKit

// child of HomeView
struct MapView: View {
  
  @Environment(BusinessModel.self) var model
  @State var selectedBusinessId: String?
  
  var body: some View {
    
    Map(selection: $selectedBusinessId) {
      
      ForEach(model.businesses, id: \.id) { b in
        Marker(b.name ?? "Restaurant", coordinate: CLLocationCoordinate2D(latitude: b.coordinates?.latitude ?? 0, longitude: b.coordinates?.longitude ?? 0))
          .tag(b.id ?? "None")
      }
    }
    .onChange(of: selectedBusinessId) { oldValue, newValue in
      // find the business matching the id
      let business = model.businesses.first { business in
        business.id == selectedBusinessId
      }
      
      // if the business is found, set it as the selected one
      if let business = business {
        model.selectedBusiness = business
      }
      // this is the same:
//      if business != nil {
//        model.selectedBusiness = business!
//      }
    }
  }
}

#Preview {
  MapView()
}
