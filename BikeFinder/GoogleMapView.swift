//
//  GoogleMapView.swift
//  BikeFinder
//
//  Created by Julia Ju on 2023-10-09.
//
import SwiftUI
import CoreLocation
import GoogleMaps


struct GoogleMapView: UIViewRepresentable{
    
    let locationManager = CLLocationManager()
    let mapView = GMSMapView()

     /// Creates a `UIView` instance to be presented.
    func makeUIView(context: Self.Context) -> GMSMapView {
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.settings.zoomGestures = true
        
        locationManager.delegate = context.coordinator
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        return mapView
    }


    /// Updates the presented `UIView` (and coordinator) to the latest
    /// configuration.
    func updateUIView(_ uiView: GMSMapView, context: Self.Context) {
           // No need to update the view in this case
       }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, CLLocationManagerDelegate {
            var parent: GoogleMapView
            
            init(_ parent: GoogleMapView) {
                self.parent = parent
            }
            
            func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                guard let location = locations.last else { return }
                let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 5.0)
                parent.mapView.camera = camera
                
            }
        }
}
