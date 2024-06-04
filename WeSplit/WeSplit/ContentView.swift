//
//  ContentView.swift
//  WeSplit
//
//  Created by Carlos Salazar on 4/22/24.
//

import SwiftUI

struct ContentView: View {
    // We start by creating our 3 State variables that detect changes and are updated accordingly
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    //commented out for challeng 3
    //let tipPercentages = [10,15,20,25,0]
    
    var grandTotal: Double {
        // create calculated field to display the total bill amount with tip
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        //Here we create a calculated field for totalPerPerson to be displayed at the end of our code
    
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
       
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationStack{
            // We start with Form because we know we will be recieving user input
            Form {
                // Next we want to create a section for the amount of the check to be entered
                Section("Enter bill amount:"){
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    // We use .keybaordType() here to distinguish which keyboard type we want to show when user enters a value to avoid confusion as we only want number values in this field
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                Picker("Number of people:", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) People")
                    }
                }
            }
            // Here we create a new picker that displays each tip percentage
            // Sections have the ability to have titles and can be added directly to the section itself almost like a parameter
            Section ("How much do you want to tip?"){
                Picker ("Tip Percentage", selection: $tipPercentage) {
                    ForEach(0..<101) {
                        Text($0, format: .percent)
                    }
                }
            // Ths is how we add a picker style to our picker
                .pickerStyle(.navigationLink)
            }
            // Next we use this section to display the check amount entered by the user
            Section ("Amount per person:") {
                Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
                Section ("Total bill amount:"){
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
        }
        .navigationTitle("WeSplit")
        // we use tool bar to hide keybpard when it is no longer needed and add a "done" button to continue selecting the requested information
        .toolbar {
            if amountIsFocused {
                Button ("Done") {
                    amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
