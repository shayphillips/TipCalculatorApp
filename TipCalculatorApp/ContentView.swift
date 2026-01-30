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
    @State var numberOfPeople: Double = 1.0
    @State var showResults: Bool = false

    // Computed variables
    var tipAmount: Double = 0.0
    var totalAmount: Double = 0.0
    var amountPerPerson: Double = 0.0
    
    var body: some View {
        
        VStack {
            // Title
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(width: 300, height: 40)
            
            Image(systemName: "dollarsign.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.vertical, 20)
            
            // Bill Amount Stack
            VStack{
                Text("Bill Amount:")
                    .fontWeight(.bold)

                Text("\(billAmount, format: .currency(code: "USD"))")
                    .customSliderTextStyle(fontColor: .purple)
                
                Slider(value: $billAmount, in: 0...500, step: 1)
                    .frame(width: 370, height: 40)
                    .accentColor(.purple)
            }
            
            // Tip Percentage Stack
            VStack{
                Text("Tip Percentage:")
                    .fontWeight(.bold)

                Text("\(tipPercentage, format: .percent)")
                    .customSliderTextStyle(fontColor: .green)
                
                Slider(value: $tipPercentage, in: 0...0.3, step: 0.01)
                    .frame(width: 370, height: 40)
                    .accentColor(.green)
            }
                   
            // Number of People Stack
            VStack{
                Text("Number of People:")
                    .fontWeight(.bold)

                Text("\(String(format: "%.0f", numberOfPeople))")
                    .customSliderTextStyle(fontColor: .orange)
                
                Slider(value: $numberOfPeople, in: 1...20, step: 1)
                    .frame(width: 370, height: 40)
                    .accentColor(.orange)
            }
            // Button and Output Stack
            VStack{
                Button{
                    showResults.toggle()
                }label: {
                    Text("\(showResults ? "Hide Results" : "Calculate")")
                        .font(.title)
                    
                    
                }
                .frame(width: 350, height: 60)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(15)
            }
            
            
            if showResults{
                let tipAmount = billAmount * tipPercentage
                let totalAmount = billAmount + tipAmount
                let amountPerPerson = totalAmount / numberOfPeople
                
                Text("Tip Amount: \(tipAmount, format: .currency(code: "USD")) \nTotalAmount: \(totalAmount, format: .currency(code: "USD")) \nAmount per Person: \(amountPerPerson, format: .currency(code: "USD"))")
                    .frame(width: 200, height: 120)
            }

        }
        .padding(.vertical, 190)
    }
}




// Custom text style for slider values
struct CustomSliderTextStyle: ViewModifier {
    var fontColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(fontColor)
            .fontWeight(.bold)
            .font(.title)
    }
}

extension View {
    func customSliderTextStyle(fontColor: Color) -> some View {
        modifier(CustomSliderTextStyle(fontColor: fontColor))
    }
}


#Preview {
    ContentView()
}
