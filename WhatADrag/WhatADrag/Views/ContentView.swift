//
//  ContentView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    
    //@EnvironmentObject var showManager: ShowManager
    
    //var show: Show

    
    @StateObject var showManager = ShowManager()
    @State var currentTab: Tab = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
            TabView(selection: $currentTab) {
                
    //            Text("Home View")
    //                .frame(maxWidth: .infinity, maxHeight: .infinity)
    //                .background()
    //                .tag(Tab.Home)
                
                HomePageView()
                    .environmentObject(showManager)
                
                Text("Search View")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background()
                    .tag(Tab.Search)
                
                Text("Notify View")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background()
                    .tag(Tab.Notify)
                
                Text("Profile View")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background()
                    .tag(Tab.Profile)
            }
            .overlay(
                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        tabButton(tab: tab)
                    }
                    .padding(.vertical)
                    .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                    .background(Color("base"))
                }
                ,
                alignment: .bottom
            )
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    
    func tabButton(tab: Tab) -> some View {
        GeometryReader { proxy in
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            } , label: {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(Color("debase"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if currentTab == tab {
                                    MaterialEffect(style: .light)
                                        .clipShape(Circle())
                                        .frame(width: 10, height: 10)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    
                                    Text(tab.tabName)
                                        .foregroundColor(Color("debase"))
                                        .font(.footnote)
                                        .padding(.top, 50)
                                }
                            }
                        )
                        .contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -15 : 0)
                }
            })
        }
        .frame(height: 25)
    }
    
}

struct UIanimeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ShowManager())
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notify = "bell"
    case Profile = "person"
    
    var tabName: String {
        switch self {
        case .Home:
            return "Home"
        case .Search:
            return "Search"
        case .Notify:
            return "Notify"
        case .Profile:
            return "Profile"
        }
    }
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
