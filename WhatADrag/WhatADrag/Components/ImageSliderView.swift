//
//  ImageSliderView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/5/23.
//

import SwiftUI

struct ImageSliderView: View {
    
    @EnvironmentObject var showManager: ShowManager
    
    @State private var currentIndex = 0
    var slides: [String] = ["cover0", "cover1", "cover2", "cover3", "cover4", "cover5", "cover6"]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .trailing) {
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: .infinity, height: 650)
                    .scaledToFit()
                    .cornerRadius(15)
            }
        }
        .padding(.leading, 2)
        .padding(.trailing, 2)
        .ignoresSafeArea()
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                if self.currentIndex + 1 == self.slides.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
//                print("current index is \(currentIndex)")
            }
        }
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView()
            .environmentObject(ShowManager())
    }
}
