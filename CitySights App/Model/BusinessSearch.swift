//
//  BusinessSearch.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/8/24.
//

import Foundation

struct BusinessSearch: Decodable {
  var businesses = [Business]()
  var region = Region()
  var total = 0
}

struct Region: Decodable {
  var center: Coordinate?
}

struct Coordinate: Decodable {
  var latitude: Double?
  var longitude: Double?
}
