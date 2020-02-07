//
//  ContentView.swift
//  WeSplit
//
//  Created by Sara Nicole Mikac on 2/3/20.
//  Copyright © 2020 Erik Mikac. All rights reserved.
//

import SwiftUI

// Content view implements View Protocol

struct ContentView: View {
    // @State watches for changes, and automatically reloads the body.
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double((Int(numberOfPeople) ?? 2))
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var grandTotal: Double {
         let tipSelection = Double(tipPercentages[tipPercentage])
         let orderAmount = Double(checkAmount) ?? 0
         let tipValue = orderAmount / 100 * tipSelection
         return orderAmount + tipValue
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People: ", text: $numberOfPeople)
                }
                Section {
                    Picker("Tip: ", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Grand Total")) {
                      Text("Grand Total: $\(grandTotal, specifier: "%.2f").")
                }
            
                Section(header: Text("Amount Per Person")) {
                      Text("Total Per Person: $\(totalPerPerson, specifier: "%.2f").")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}

// MARK: Content_View
// This portion of the code is only used so that you app can be previed in XCode.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
