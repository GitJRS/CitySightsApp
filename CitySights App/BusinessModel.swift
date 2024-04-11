//
//  BusinessModel.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/9/24.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class BusinessModel: NSObject, CLLocationManagerDelegate {
  
  var businesses = [Business]()
  var query: String = ""
  var selectedBusiness: Business?
  
  var dataService = DataService()
  var locationManager = CLLocationManager()
  var currentUserLocation: CLLocationCoordinate2D?
  
  override init() {
    super.init()
    
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    locationManager.delegate = self
  }
  
  func getBusinesses() {
    
    Task {
      businesses = await dataService.businessSearch(userLocation: currentUserLocation)
    }
  }
  
  func getUserLocation() {
    
    // check permission
    if locationManager.authorizationStatus == .authorizedWhenInUse {
      
      currentUserLocation = nil
      locationManager.requestLocation()
    } 
    else {
      locationManager.requestWhenInUseAuthorization()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    // detect if user allowed, then request location
    if manager.authorizationStatus == .authorizedWhenInUse {
      
      currentUserLocation = nil
      manager.requestLocation()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    currentUserLocation = locations.last?.coordinate
    
    if currentUserLocation != nil {
      // search businesses api call
      getBusinesses()
    }
    manager.stopUpdatingLocation()
  }
}
