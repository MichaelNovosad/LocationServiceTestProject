//
//  ContentView.swift
//  CoreLocationTestProject
//
//  Created by Michael Novosad on 05.04.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Location Status: \(locationManager.authorizationStatus.rawValue)")
            
            if let location = locationManager.lastLocation {
                Text("Lat: \(location.coordinate.latitude)")
                Text("Long: \(location.coordinate.longitude)")
            }
            
            Button("Request When In Use") {
                locationManager.requestWhenInUseAuthorization()
            }
            
            Button("Request Always") {
                locationManager.requestAlwaysAuthorization()
            }
            
            Button(locationManager.isLocationUpdating ? "Stop Updates" : "Start Updates") {
                if locationManager.isLocationUpdating {
                    locationManager.stopUpdatingLocation()
                } else {
                    locationManager.startUpdatingLocation()
                }
            }
            
            Button("Get Single Location") {
                locationManager.requestLocation()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
