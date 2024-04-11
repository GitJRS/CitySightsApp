//
//  DataService.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/8/24.
//

import Foundation
import CoreLocation

struct DataService {
  
  let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
  
  func businessSearch(userLocation: CLLocationCoordinate2D?, 
                      query: String?,
                      options: String?,
                      category: String?) async -> [Business] {
    
    // 0. check if api key exists
    guard apiKey != nil else {
      return [Business]()
    }
    
    // defaults
    var lat = 35.665517
    var long = 139.770398
    
    // user coordinates
    if let userLocation = userLocation {
      lat = userLocation.latitude
      long = userLocation.longitude
    }
    
    var endpointUrlString = "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&limit=10"
    
    // query
    if query != nil && query != "" {
      endpointUrlString.append("&term=\(query!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")
    }
    
    // options
    if options != nil && options != "" {
      endpointUrlString.append("&attributes=\(options!)")
    }
    
    // category
    if let category = category {
      endpointUrlString.append("&categories=\(category)")
    }
    
    // 1. create url
    if let url = URL(string: endpointUrlString) {
      
      // 2. create request
      var request = URLRequest(url: url)
      request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
      request.addValue("appication/json", forHTTPHeaderField: "accept")
      
      // 3. send request
      do {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // 4. parse json
        let decoder = JSONDecoder()
        let result = try decoder.decode(BusinessSearch.self, from: data)
        
        return result.businesses
      }
      catch {
        print(error)
      }
    }
    
    return [Business]()
  }
}
