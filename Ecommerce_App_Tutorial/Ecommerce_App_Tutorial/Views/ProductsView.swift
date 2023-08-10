//
//  ProductsView.swift
//  Ecommerce_App_Tutorial
//
//  Created by Abhimanyu Joshi on 8/4/23.
//

import SwiftUI

struct ProductsView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCardView(product: product)
                    }
                }
                .padding()
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(CartManager())
    }
}
