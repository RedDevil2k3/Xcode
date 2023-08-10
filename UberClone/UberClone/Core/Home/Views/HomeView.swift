//
//  HomeView.swift
//  UberClone
//
//  Created by Abhimanyu Joshi on 7/25/23.
//

import SwiftUI

struct HomeView: View {
   // @State private var showLocationSearchView = false
    @State private var mapState = MapViewState.noInput //for the MapViewState model
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        ZStack (alignment: .bottom) { //for RideRequestView
            ZStack(alignment: .top) { // puts stuff on stuff like layers in photoshop, here used to put search bar over the mapView
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView(mapState: $mapState)
                } else if mapState == .noInput {
                    LocationSearchActivationView()
                        .padding(.top, 70)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                }
                

                
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 5)
            }
            
            if mapState == .locationSelected || mapState == .polylineAdded {
                RideRequestView()
                    .transition(.move(edge: .bottom)) //for RideRequestView
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation) { location in //looks for published values
            if let location = location {
                //print("DEBUG: User Location in home view is \(location)")
                locationViewModel.userLocation = location
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
