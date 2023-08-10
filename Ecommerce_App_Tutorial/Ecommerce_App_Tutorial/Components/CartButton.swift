//
//  CartButton.swift
//  Ecommerce_App_Tutorial
//
//  Created by Abhimanyu Joshi on 8/4/23.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int64
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "bag.fill")
                .foregroundColor(.black)
                .padding(5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color("kPrimary"))
                    .cornerRadius(50)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 1)
    }
}
