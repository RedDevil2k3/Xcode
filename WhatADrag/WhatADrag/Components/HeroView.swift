//
//  HeroView.swift
//  WhatADrag
//
//  Created by Abhimanyu Joshi on 8/10/23.
//

import SwiftUI

public var randomInt = 0 //Int.random(in: 0..<7)

struct HeroView: View {
    
    @EnvironmentObject var showManager: ShowManager
    var show: Show
    
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(show.image)
                .resizable()
                .frame(width: .infinity, height: 600)
                .cornerRadius(12)
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 5, repeats: true) {timer in
                        if randomInt + 1 == 7 {
                            randomInt = 0
                        } else {
                            randomInt += 1
                        }
                    }
                    //print("1.      DEBUG: RANDOM INT GENERATED IS \(randomInt)")
                }
                .onReceive(timer, perform: { time in
                    //let randomInt = randomInt
                    print("_________________________DEBUG: RANDOM INT GENERATED IS \(randomInt)")
                })
        }
    }
}




struct HeroView_Previews: PreviewProvider {
    static var previews: some View {

        HeroView(show: ShowList[randomInt])
            .environmentObject(ShowManager())
            }
    }
