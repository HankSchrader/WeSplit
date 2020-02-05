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
    @State private var checkoutAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]

    var body: some View {
        Form {
            Section {
                TextField("Amount", text: $checkoutAmount)
                    .keyboardType(.decimalPad)
                Picker("Number of people:", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                        }
                    }
            }
            Section {
                Picker("Tip: ", selection: $tipPercentage) {
                    ForEach(0..<tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section {
                Text("Check Amount: $\(checkoutAmount).")
            }
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
