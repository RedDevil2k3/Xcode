//
//  ContentView.swift
//  CardioPredictor
//
//  Created by Abhimanyu Joshi on 8/11/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var age = 18
    @State private var gender = 1
    @State private var height = 165
    @State private var weight = 65
    @State private var ap_hi = 110
    @State private var ap_lo = 80
    @State private var cholesterol = 1
    @State private var gluc = 1
    @State private var smoke = 0
    @State private var alco = 0
    @State private var active = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("AGE: ")
                        .font(.headline)
                    Stepper("\(age)", value: $age, in: 18...100, step: 1)
                }
                HStack {
                    Text("GENDER: ")
                        .font(.headline)
                    
                    Stepper("\(gender)", value: $gender, in: 1...2, step: 1 )
                }
                HStack{
                    Text("HEIGHT: ")
                        .font(.headline)
                    Stepper("\(height)", value: $height, in: 100...250, step: 1)
                }
                HStack{
                    Text("WEIGHT: ")
                        .font(.headline)
                    Stepper("\(weight)", value: $weight, in: 25...250, step: 1)
                }
                HStack{
                    Text("BPsys: ")
                        .font(.headline)
                    Stepper("\(ap_hi)", value: $ap_hi, in: 110...200, step: 1)
                }
                HStack{
                    Text("BPdia: ")
                        .font(.headline)
                    Stepper("\(ap_lo)", value: $ap_lo, in: 10...100, step: 1)
                }
                HStack{
                    Text("CHOLESTEROL: ")
                        .font(.headline)
                    Stepper("\(cholesterol)", value: $cholesterol, in: 0...1, step: 1)
                }
                HStack{
                    Text("GLUCOSE: ")
                        .font(.headline)
                    Stepper("\(gluc)", value: $gluc, in: 0...1, step: 1)
                    
                }
                HStack{
                    Text("SMOKE: ")
                        .font(.headline)
                    Stepper("\(smoke)", value: $smoke, in: 0...1, step: 1)
                }
                HStack{
                    Text("ALCOHOL: ")
                        .font(.headline)
                    Stepper("\(alco)", value: $alco, in: 0...1, step: 1)
                }
//                HStack{
//                    Text("ACTIVITY: ")
//                        .font(.headline)
//                    Stepper("\(active)", value: $active, in: 0...1, step: 1)
//                }
            }
            .padding()
            .navigationTitle("CardioPredictor")
            .toolbar{
                Button("Prediction", action: diseasePrediction)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func diseasePrediction() {
        do {
            let config = MLModelConfiguration()
            let model = try CardioTabularRegressor(configuration: config)
            
            let prediction = try model.prediction(age: Double(age), gender: Double(gender), height: Double(height), weight: Double(weight), ap_hi: Double(ap_hi), ap_lo: Double(ap_lo), cholesterol: Double(cholesterol), gluc: Double(gluc), smoke: Double(smoke), alco: Double(alco), active: Double(1.00))
            
            let result = prediction.cardio
            
            alertTitle = "The Prediction Value is"
            alertMessage = String(result.formatted(.number))
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Problem while making a prediction"
        }
        
        showingAlert = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
