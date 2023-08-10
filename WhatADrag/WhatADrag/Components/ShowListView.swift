//
//  ShowListView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/5/23.
//

import SwiftUI

struct ShowListView: View {
    
    @EnvironmentObject var showManager: ShowManager
    var show: Show
    
    var body: some View {
        HStack(spacing: 20) {
            Image(show.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .cornerRadius(10)
            Text(show.name)
                .bold()
                .font(.title2)
                .foregroundColor(Color("debase"))
            
            Spacer()
            
//            NavigationLink(destination: ShowVideoPlayerView(show: show)
//                .environmentObject(showManager)) {
//                    ShowPlayButton(show: show)
//                }
            Image(systemName: "play.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(Color("debase"))
                .onTapGesture {
                    showManager.addToWatch(show: show)
            }
        }
        .padding(.horizontal)
        .background(Color("base"))
        .cornerRadius(12)
        .frame(width: .infinity, alignment: .leading)
    }
}

struct ShowListView_Previews: PreviewProvider {
    static var previews: some View {
        ShowListView(show: ShowList[0])
            .environmentObject(ShowManager())
    }
}
