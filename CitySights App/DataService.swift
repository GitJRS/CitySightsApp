//
//  DataService.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/8/24.
//

import Foundation

struct DataService {
  
  let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
  
  func businessSearch() async {
    
    // 0. check if api key exists
    guard apiKey != nil else {
      return
    }
    
    // 1. create url
    if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=35.665517&longitude=139.770398&&categories=restaurants&limit=10") {
      
      // 2. create request
      var request = URLRequest(url: url)
      request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
      request.addValue("appication/json", forHTTPHeaderField: "accept")
      
      // 3. send request
      do {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print(data)
        print(response)
      }
      catch {
        print(error)
      }
    }
  }
}
