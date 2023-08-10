//
//  HomePageView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/5/23.
//

import SwiftUI

struct HomePageView: View {
    
    @EnvironmentObject var showManager: ShowManager
   
    
    //var show: Show
    
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .top) {
                Color("base")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    ScrollView {
                        AppBar()
                        NavigationStack{
                            
                        }
                        ImageSliderView()
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                ForEach(ShowList, id: \.id) { show in
                                    NavigationLink {
                                        ShowDetailsView(show: show)
                                    } label: {
                                        ShowCardView(show: show)
                                            .environmentObject(showManager)
                                    }
                                }
                                
                            }
                        }
                        .padding(.bottom, 50)
                    }
                }
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {

    static var previews: some View {
        HomePageView()
            .environmentObject(ShowManager())
           
    }
}

struct AppBar: View {
    @EnvironmentObject var showManager: ShowManager
    
    
    //var show: Show
   
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                HStack{
                    Text("LUCI")
                        .font(.largeTitle .bold())
                        .foregroundColor(Color("title"))
                    + Text("VERSE")
                        .font(.largeTitle .bold())
                        .foregroundColor(Color("debase"))
                    Spacer()
                    
                    NavigationLink(destination: AllShowsView()
                        .environmentObject(showManager)) {
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("debase"))
                                .padding(.trailing, 2)
                        }
                    
                    
                }
                .padding(.trailing, 10)
                .padding(.leading, 5)
            }
        }
        .padding()
        .environmentObject(ShowManager())
    }
}
