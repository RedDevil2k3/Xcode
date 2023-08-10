//
//  HomePageView.swift
//  Ecommerce_App_Tutorial
//
//  Created by Abhimanyu Joshi on 8/4/23.
//

import SwiftUI

struct HomePageView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    AppBar()
                    SearchView()
                    ImageSliderView()
                    
                    HStack {
                        Text("All Products")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            ProductsView()
                        }, label: {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundColor(Color("kPrimary"))
                        })
                    }
                    .padding(.top, 0)
                    .padding(.bottom, 0)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(productList, id: \.id) {product in
                                NavigationLink{
                                    ProductDetailsView(product: product)
                                } label: {
                                    ProductCardView(product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.top, 0)
                        .padding(.bottom, 0)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)//.horizontal)
                    }
                }
            }
        }
        .environmentObject(cartManager)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(CartManager())
    }
}

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                HStack{
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    Text("Indore, MP")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                    
                    NavigationLink(destination: CartView()
                        .environmentObject(cartManager)) {
                        CartButton(numberOfProducts: Int64(cartManager.products.count))
                    }
                }
                
                Text("Discover")
                    .font(.largeTitle .bold())
                
                + Text(" LUXURY")
                    .font(.largeTitle .bold())
                    .foregroundColor(Color("kPrimary"))
            }
        }
        .padding()
        .environmentObject(CartManager())
    }
}
