//
//  ShowDetailsView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/5/23.
//

import SwiftUI

struct ShowDetailsView: View {
    
    var show: Show
    
    
    var body: some View {
        ScrollView {
            ZStack {
                Color("base")
                
                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing) {
                        
                        Image(show.image)
                            .resizable()
                            //.ignoresSafeArea(edges: .top)
                            .frame(height: 600)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(show.name)
                                .font(.title .bold())
                                .foregroundColor(Color("debase"))
                        }
                        .padding(.vertical)
                        
                        Text("Description")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("debase"))
                        
                        Text(show.description)
                            .foregroundColor(Color("debase"))
                            .font(.title3)
                            .padding(.top, 2)
                        
                        Text("Trailer")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("debase"))
                            .padding(.top, 10)
                        
                        //ShowVideoPlayerView(show: show)
                        
                        Text("Episodes")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("debase"))
                            .padding(.top, 10)
                    }
                    .padding()
                    .background(Color("base"))
                    
                    AllEpisodesView()
                }
                .padding(.bottom, 50)
                .background(Color("base"))
            }
        }
        .background(Color("base"))
        .ignoresSafeArea(edges: .top)
    }
}

struct ShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailsView(show: ShowList[0])
    }
}
