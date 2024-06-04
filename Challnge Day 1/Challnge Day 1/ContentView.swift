//
//  ContentView.swift
//  Challenge Day 1
//
//  Created by Carlos Salazar on 5/21/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Feet"
    @State private var outputUnit = "Yards"
    @State private var inputUnitValue = 0.0

    var outputValue: Double {
        if inputUnit == outputUnit {
            return inputUnitValue
        } else if inputUnit == "Feet" && outputUnit == "Yards" {
            return inputUnitValue / 3
        } else if inputUnit == "Feet" && outputUnit == "Meters" {
            return inputUnitValue / 3.281
        } else if inputUnit == "Feet" && outputUnit == "Kilometers" {
            return inputUnitValue / 3281
        } else if inputUnit == "Feet" && outputUnit == "Miles" {
            return inputUnitValue / 5280
        } else if inputUnit == "Yards" && outputUnit == "Feet" {
            return inputUnitValue * 3
        } else if inputUnit == "Yards" && outputUnit == "Meters" {
            return inputUnitValue / 1.094
        } else if inputUnit == "Yards" && outputUnit == "Kilometers" {
            return inputUnitValue / 1094
        } else if inputUnit == "Yards" && outputUnit == "Miles" {
            return inputUnitValue / 1760
        } else if inputUnit == "Kilometers" && outputUnit == "Miles" {
            return inputUnitValue / 1.609
        } else if inputUnit == "Kilometers" && outputUnit == "Meters" {
            return inputUnitValue * 1000
        } else if inputUnit == "Kilometers" && outputUnit == "Feet" {
            return inputUnitValue * 3281
        } else if inputUnit == "Kilometers" && outputUnit == "Yards" {
            return inputUnitValue * 1094
        }else if inputUnit == "Meters" && outputUnit == "Yards" {
            return inputUnitValue * 1.094
        }else if inputUnit == "Meters" && outputUnit == "Feet" {
            return inputUnitValue * 3.281
        }else if inputUnit == "Meters" && outputUnit == "Kilometers" {
            return inputUnitValue / 1000
        }else if inputUnit == "Meters" && outputUnit == "Miles" {
            return inputUnitValue / 1609
        }else if inputUnit == "Miles" && outputUnit == "Yards" {
            return inputUnitValue * 1760
        }else if inputUnit == "Miles" && outputUnit == "Feet" {
            return inputUnitValue * 5280
        }else if inputUnit == "Miles" && outputUnit == "Meters" {
            return inputUnitValue * 1609
        }else if inputUnit == "Miles" && outputUnit == "Kilometers" {
            return inputUnitValue * 1.609
        }
        return inputUnitValue
    }

    var units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]

    var body: some View {
        NavigationStack {
            // We start with Form because we know we will be receiving user input
            Form {
                Section("Input Unit Value") {
                    Picker("Choose your unit:", selection: $inputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    TextField("Enter Unit Value", value: $inputUnitValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Output Unit Type") {
                    Picker("Choose your unit:", selection: $outputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                Section("Output") {
                    Text(outputValue, format: .number)
                }
            }
            .navigationTitle("Length Converter📏")
        }
    }
}
#Preview {
    ContentView()
}
