//
//  ContentView.swift
//  TipCalculatorApp
//
//  Created by Shay Phillips on 1/29/26.
//

import SwiftUI

struct ContentView: View {
    
    // State variables
    @State var billAmount: Double = 0.0
    @State var tipPercentage: Double = 0.0
    @State var numberOfPeople: Double = 0.0
    @State var showResults: Bool = false

    // Computed variables
    var tipAmount: Double = 0.0
    var totalAmount: Double = 0.0
    var amountPerPerson: Double = 0.0
    
    var body: some View {
        // Title
        Text("Tip Calculator")
            .font(.title)
            .fontWeight(.bold)

            Spacer()
        
        // Slider Stack
        VStack {
            
            // Bill Amount Slider
            HStack{
                Text("Bill Amount:")
                    .frame(width: 120, height: 30)

                Text("\(billAmount, format: .currency(code: "USD"))")
                    .frame(width: 150, height: 30)
            }
            
            Slider(value: $billAmount, in: 0...500, step: 0.01)
                .frame(width: 370, height: 50)
            
            
            // Tip Percentage Slider
            HStack{
                Text("Tip Percentage:")
                    .frame(width: 180, height: 30)

                Text("\(tipPercentage, format: .percent)")
                    .frame(width: 80, height: 30)
            }
            
            Slider(value: $tipPercentage, in: 0...30, step: 0.1)
                .frame(width: 370, height: 50)

            
            // Number of People Slider


            

        }
        .padding(.vertical, 300)
    }
}


#Preview {
    ContentView()
}
