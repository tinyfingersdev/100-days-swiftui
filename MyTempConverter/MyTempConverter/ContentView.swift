//
//  ContentView.swift
//  MyTempConverter
//
//  Created by Shannon Paige on 1/1/24.
//

import SwiftUI

enum Measurement : CaseIterable, Identifiable {
    case Celcius
    case Fahrenheit
    case Kelvin
    
    var id: Self {self}
}


struct ContentView: View {
    
    @State private var selectedSourceMeasurement = Measurement.Celcius
    @State private var selectedTargetMeasurement = Measurement.Fahrenheit
    @State private var inputValue = 0.0
    
    @FocusState private var inputIsFocused: Bool

    var convertToCelciusBase: Double {
        
        if selectedSourceMeasurement == Measurement.Kelvin {
            
            return inputValue - 273.15
            
        } else if selectedSourceMeasurement == Measurement.Fahrenheit {
            
            return (inputValue - 32) / 1.8000
        }
        
        return inputValue
    }
    
    var convertedTemp: String {
        
        let convertedToCelcius = convertToCelciusBase
        
        if(selectedTargetMeasurement == Measurement.Celcius) {
            return "\(round(convertedToCelcius * 100) / 100)\u{00B0}C"
            
        } else if selectedTargetMeasurement == Measurement.Fahrenheit {
            return "\(round(((convertedToCelcius * 1.800) + 32) * 100) / 100)\u{00B0}F"
            
        } else  {
            return "\(round((273.15 + convertedToCelcius) * 100) / 100)K"
            
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section("Input Temperature") {
                    TextField("Temperature", value: $inputValue, format: .number)
                        .keyboardType(.numberPad)
                        .focused($inputIsFocused)
                }
                

                Section("Choose Source Measurement") {
                     Picker("Source", selection: $selectedSourceMeasurement) {
                        ForEach(Measurement.allCases) { option in
                            Text(String(describing: option))
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Choose Target Measurement") {
                    Picker("Target", selection: $selectedTargetMeasurement) {
                        
                        ForEach(Measurement.allCases) { option in
                            Text(String(describing: option))
                            
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output Temperature") {
                    Text(convertedTemp)
                }
                
            }
            .navigationTitle("Temp Converter")
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
