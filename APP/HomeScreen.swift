//
//  HomeScreen.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-29.
//
import SwiftUI

struct HomeScreen: View {
    @Binding var selectedCountry: Country?
    @Binding var balance: String
    @State private var selectedOption: String = "Expenses" // Default selection

    var body: some View {
        VStack {
            Text("Account Balance:")
                .font(.headline)
                .padding(.top, 20)
            
            Text("\(selectedCountry?.currency ?? "") \(balance)")
                .font(.title)
                .fontWeight(.bold)
            
            Picker("Select", selection: $selectedOption) {
                Text("Expenses").tag("Expenses")
                Text("Income").tag("Income")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 20)
            .padding(.top, 30)
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)    }
}
