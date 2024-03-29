//
//  RideRequestView.swift
//  UberClone
//
//  Created by Abhimanyu Joshi on 7/29/23.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .uberX
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 50, height: 7)
                .padding(.top, 7)
            
            // trip info view
            
            HStack{
                // indicator view
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 7, height: 7)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 7, height: 7)
                }
                
                VStack(alignment: .leading, spacing: 25) {
                    HStack {
                        Text("Current location")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text(locationViewModel.pickupTime ?? "")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        if let location = locationViewModel.selectedUberLocation {
                            Text(location.title)
                                .font(.system(size: 15, weight: .semibold))
                        }
                            
                        
                        Spacer()
                        
                        Text(locationViewModel.dropOffTime ?? "")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 7)
            }
            .padding()
            
            Divider()
            
            // ride type selection view
            
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading) //pushes text to left
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(RideType.allCases) { type in
                        VStack(alignment: .leading) {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack (alignment: .leading, spacing: 5) {
                                
                                Text(type.description)
                                    .font(.system(size: 15, weight: .semibold))
                                    
                                
                                Text(locationViewModel.computeRidePrice(forType: type).toCurrency())
                                    .font(.system(size: 15, weight: .semibold))
                                    
                            }
                            .padding(12)
                            
                            
                        }
                        .frame(width: 110, height: 150)
                        .foregroundColor(type == selectedRideType ? .white : Color.theme.primaryTextColor)
                        //.background(Color(type == selectedRideType ? .systemBlue : .systemGroupedBackground))
                        .background(type == selectedRideType ? .blue : Color.theme.secondaryBackgroundColor)
                        .scaleEffect(type == selectedRideType ? 1.2 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedRideType = type
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 7)
            
            // payment option view
            
            HStack(spacing: 10) {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(5)
                    .background(.blue)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("**** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color.theme.secondaryBackgroundColor)
            .cornerRadius(10)
            .padding(.horizontal)
            
            // request ride button
            
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }

        }
        .padding(.bottom, 25)
        .background(Color.theme.backgroundColor)
        .cornerRadius(15)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
