//
//  ContentView.swift
//  CurencyViwe
//
//  Created by Seham almarshedi on 30/04/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var itemSelected = 0
    @State private var itemSelected2 = 1
    @State private var amount : String = ""
    private let currencies = ["EUR","SAR"]

    func convert(_ convert: String) -> String{
        var conversion: Double = 1.0
        let amount = Double(convert)  ?? 0.0
        let selectedCurrency = currencies[itemSelected]
        let to = currencies[itemSelected2]
        let euroRates = [ "EUR":0.1,"SAR":4.06]
        let sarRates = [ "EUR":0.25 ,"SAR":0.1]
        
        switch (selectedCurrency){
            
        case "EUR" :
            conversion = amount * (euroRates[to] ?? 0.0)
        case "SAR" :
            conversion = amount * (sarRates[to] ?? 0.0)
        default:
            print("Something went wrong!")
           
            
        }
        return String(format: "%.2f" ,conversion)
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Convert a currency")){
                    
                    TextField("Enter an amount",text: $amount)
                        .keyboardType(.decimalPad)
                    
                    Picker( selection:$itemSelected,label: Text("From")){
                        ForEach(0..<currencies.count){
                            
                            index in Text(self.currencies[index]).tag(index)
                        }
                        
                    }
                    Picker(selection:$itemSelected2,label: Text("To")){
                        ForEach(0..<currencies.count){
                            
                            index in Text(self.currencies[index]).tag(index)
                        }
                        
                    }
                }
                Section(header: Text("Conversion")) {
                    Text("\(convert(amount))\(currencies[itemSelected2])")
                                     
                                     
                                     }
                
            }
        }}
}



#Preview {
    ContentView()
}

