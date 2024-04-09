//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/9/24.
//

import SwiftUI

struct BusinessDetailView: View {
  
  var business: Business?
  
    var body: some View {
      Text(business?.name ?? "-business name-")
    }
}

#Preview {
    BusinessDetailView()
}
