//
//  RideType.swift
//  UberClone
//
//  Created by Abhimanyu Joshi on 7/29/23.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable { //these are the protocols to abide by. CaseIterable wraps all the case options into an array to be used by other functions.
    case uberX
    case black
    case uberXL
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .uberX: return "UberX"
        case .black: return "UberBlack"
        case .uberXL: return "UberXL"
        }
    }
    
    var imageName: String {
        switch self {
        case .uberX: return "uber-x"
        case .black: return "uber-black"
        case .uberXL: return "uber-x"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .uberX: return 5
        case .black: return 20
        case .uberXL: return 10
        }
    }
    
    //Pricing model for ride prices
    
    func computePrice(for distanceInMeters: Double) -> Double {
        //let distanceInMiles = distanceInMeters / 1600 // for US ofcourse
        let distanceInKilometers = distanceInMeters / 1000
        
        switch self {
        case .uberX: return distanceInKilometers * 1.5 + baseFare
        case .black: return distanceInKilometers * 2.0 + baseFare
        case .uberXL: return distanceInKilometers * 1.75 + baseFare
        }
    }
}
