//
//  UberMapViewRepresentable.swift
//  UberClone
//
//  Created by Abhimanyu Joshi on 7/25/23.
//

import Foundation
import SwiftUI
import MapKit

struct UberMapViewRepresentable: UIViewRepresentable {
    
    let mapView = MKMapView()
    //let locationManager = LocationManager.shared //using the shared instance created in LocationManager. //dont need it anymore, its being called in homeView instead.
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel //declared in App/UberCloneApp
    
    //func for making our mapview ui
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator //refrences to func makeCoordinator() -> MapCoordinator. we used it here coz we have the context obj in this func
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("DEBUG: Map state is \(mapState)")
        
        switch mapState {
        case .noInput:
            context.coordinator.clearMapViewAndRecenterOnUserLocation()
            break
        case .searchingForLocation:
            break
        case .locationSelected:
            if let coordinate = locationViewModel.selectedUberLocation?.coordinate {
                //print("DEBUG: Coordinate is \(coordinate)")
                print("DEBUG: adding stuff to map")
                context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
                context.coordinator.configurePolyline(withDestinationCoordinate: coordinate)
            }
            break
        case .polylineAdded:
            break
        }
    }
    
    
    
    func makeCoordinator() -> MapCoordinator { //this func is a requirement of the UIViewRepresentable protocol
        return MapCoordinator(parent: self)
    }
    
}


extension UberMapViewRepresentable {
    
    //MKMapViewDelegate provides us to use the functionality of the UI kit framework
    //MKMapViewDelegate scope is just only within the class
    //MapCoordinator acts as a medium between MKMapViewDelegate adn rest of the code
    //MapCoordinator is responsible for any changes we want to make to our mapviewUI globally
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        
        //MARK: - Properties
        
        let parent: UberMapViewRepresentable
        var userLocationCoordinate: CLLocationCoordinate2D? //created a class level property coz user location coordinates will be used by multiple functions.
        var currentRegion: MKCoordinateRegion?
        
        //MARK: - Lifecycle
        
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        //MARK: MKMapViewDelegate
        
        // func for zooming in to user's location on the mapUI after allowing the app location permission.
        // handles all of the app's location updates
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate // gives access to our class level property
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            
            self.currentRegion = region
            
            parent.mapView.setRegion(region, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer { //draws the line for the route from origin to dest
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .systemBlue
            polyline.lineWidth = 5
            return polyline
        }
        
        //MARK: - Helpers
        
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) { //called in updateUIView
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            let anno = MKPointAnnotation() //destination marker
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation(anno, animated: true)
        }
        
        func configurePolyline(withDestinationCoordinate coordinate: CLLocationCoordinate2D) {
            guard let userLocationCoordinate = self.userLocationCoordinate else {return}
            parent.locationViewModel.getDestinationRoute(from: userLocationCoordinate, to: coordinate) { route in
                self.parent.mapView.addOverlay(route.polyline)  // this is our completion block as defined in the fucntion getDestinationRoute coz since apple uses its map api to returnt he coordinates so it always requires a completion block.
                self.parent.mapState = .polylineAdded
                let rect = self.parent.mapView.mapRectThatFits(route.polyline.boundingMapRect, edgePadding: .init(top: 65, left: 32, bottom: 500, right: 32)) //for the RideRequestView card. height of the card is 500px hence the bottom padding is 500. fits the map view when the ride card is showing.
                self.parent.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
        

        
        func clearMapViewAndRecenterOnUserLocation() { //for the clear map view when no location is selected or being searched
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            parent.mapView.removeOverlays(parent.mapView.overlays)
            
            if let currentRegion = currentRegion {
                parent.mapView.setRegion(currentRegion, animated: true)
            }
        }
    }
}
