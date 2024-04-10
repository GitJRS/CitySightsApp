//
//  BusinessModel.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/9/24.
//

import Foundation
import SwiftUI

@Observable
class BusinessModel {
  
  var businesses = [Business]()
  var query: String = ""
  var selectedBusiness: Business?
  
  var dataService = DataService()
  
  func getBusinesses() {
    
    Task {
      businesses = await dataService.businessSearch()
    }
  }
}
