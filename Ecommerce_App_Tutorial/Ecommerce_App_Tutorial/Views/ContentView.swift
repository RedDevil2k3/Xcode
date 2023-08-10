//
//  ContentView.swift
//  Ecommerce_App_Tutorial
//
//  Created by Abhimanyu Joshi on 8/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager() //initiates an observable object
    @State var currentTab: Tab = .Home //default tab when opening the app
    
    init() {
        UITabBar.appearance().isHidden = true //to hide the tab bar in the main home view.
    }
    
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $currentTab) {
            
//            Text("Home View")
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background()
//                .tag(Tab.Home)
            
            HomePageView()
                .environmentObject(cartManager)
            
            Text("Search View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Search)
            
            Text("Notify View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Notify)
            
            Text("Cart View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Cart)
            
            Text("Profile View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Profile)
        }
        .overlay(
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    tabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                .background(Color("kSecondary"))
            }
            ,
            alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    func tabButton(tab: Tab) -> some View {
        GeometryReader { proxy in
            Button(action: {
                withAnimation(.spring()){
                    currentTab = tab
                }
            } , label: {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(Color("kPrimary"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack{
                                if currentTab == tab {
                                    MaterialEffect(style: .light)
                                        .clipShape(Circle())
                                        .frame(width: 10, height: 10)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    
                                    Text(tab.tabName)
                                        .foregroundColor(.primary)
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CartManager())
    }
}


enum Tab: String, CaseIterable {
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notify = "bell"
    case Cart = "bag"
    case Profile = "person"
    
    var tabName: String {
        switch self {
        case . Home:
            return "Home"
        case .Search:
            return "Search"
        case .Notify:
            return "Notify"
        case .Cart:
            return "Cart"
        case .Profile:
            return "Profile"
        }
    }
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero // .zero here is an inset struct
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero // .zero here is an inset struct
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
