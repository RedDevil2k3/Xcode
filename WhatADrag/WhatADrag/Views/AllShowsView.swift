//
//  AllShowsView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/5/23.
//

import SwiftUI

struct AllShowsView: View {
    
    @EnvironmentObject var showManager: ShowManager
    
    //var show: Show
    
    var column = [GridItem(.adaptive(minimum: 300), spacing: 20)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(ShowList, id: \.id) { show in
                        NavigationLink {
                            ShowDetailsView(show: show)
                        } label: {
                            ShowListView(show: show)
                                .environmentObject(showManager)
                        }
                    }
                }
                .padding(.top, 100)
                .background(Color("base"))
            }
            .ignoresSafeArea()
        }
    }
}

struct AllShowsView_Previews: PreviewProvider {
    static var previews: some View {
        AllShowsView()
            .environmentObject(ShowManager())
    }
}
