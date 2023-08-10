//
//  ShowCardView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/5/23.
//

import SwiftUI

struct ShowCardView: View {
    
    @EnvironmentObject var showManager: ShowManager
    var show: Show
    
    var body: some View {
        ZStack{
            Color("base")
            
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    Image(show.image)
                        .resizable()
                        .frame(width: 250, height: 400)
                        .cornerRadius(12)
                    Text(show.name)
                        .foregroundColor(Color("debase"))
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.vertical, 1)
                }
                
                Button {
                    showManager.addToWatch(show: show)
                } label: {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("debase"))
                        .padding(.trailing)
                }
            }
        }
        .frame(width: 270, height: 500)
        .cornerRadius(15)
    }
}

struct ShowCardView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCardView(show: ShowList[0])
            .environmentObject(ShowManager())
    }
}
