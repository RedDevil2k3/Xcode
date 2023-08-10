//
//  MapViewState.swift
//  UberClone
//
//  Created by Abhimanyu Joshi on 7/29/23.
//

import Foundation

enum MapViewState {
    case noInput
    case searchingForLocation
    case locationSelected
    case polylineAdded // created a new state coz while ride was selected the app would incessantly ping the pick-up and drop-off locations in a loop.
}
