//
//  LocationSearchView.swift
//  UberClone
//
//  Created by Abhimanyu Joshi on 7/25/23.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = "" //created coz loaction search strings requires a binding property
//    @State private var destinationLocationText = ""//created coz loaction search strings requires a binding property. Deprecated.
    //@Binding var showLocationSearchView: Bool
    @Binding var mapState: MapViewState // MapViewState in models
    @EnvironmentObject var viewModel: LocationSearchViewModel //declared in App/UberCloneApp
    
    var body: some View {
        VStack {
            //header View
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 7, height: 7)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 25)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 7, height: 7)
                }
                
                VStack {
                    TextField("Pick up location",text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            
            //list view
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    viewModel.selectLocation(result)
                                    //showLocationSearchView.toggle()
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
        }
        .background(Color.theme.backgroundColor)
        //.background(.white)
        
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
    }
}
