//
//  EnterBalanceView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-29.
//
import SwiftUI

struct NextScreen: View {
    @Binding var selectedCountry: Country?
    @State private var balance = ""
    @State private var isBalanceSaved = false
    @State private var navigateToHomeScreen = false // State for navigation

    var body: some View {
        VStack {
            Text("Enter Main Account Balance")
                .font(.system(size: 25, weight: .bold))
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .padding(.bottom, 20)

            Text("You can add more accounts in the Accounts section.")
                .font(.subheadline)
                .foregroundColor(Color.gray)
                .padding(.bottom, 30)

            TextField("Balance (\(selectedCountry?.currency ?? ""))", text: $balance)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.system(size: 20))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
            
            NavigationLink(
                destination: HomeScreen(selectedCountry: $selectedCountry, balance: $balance),
                isActive: $navigateToHomeScreen, // Activate the navigation link
                label: {
                    EmptyView() // This is a hidden NavigationLink used to trigger navigation
                }
            )
            
            Button(action: {
                // Save the balance with the selected country's currency here
                if let selectedCountry = selectedCountry, !balance.isEmpty {
                    // You can implement the logic to save the balance here.
                    // For example, you can create a data model to store the balances
                    // associated with countries.

                    // Once the balance is saved, set isBalanceSaved to true
                    isBalanceSaved = true

                    // Activate the navigation to the HomeScreen
                    navigateToHomeScreen = true
                }
            }) {
                Text("Save Balance")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
            }
            .disabled(balance.isEmpty || isBalanceSaved)
            .padding(.horizontal, 20)
            .padding(.top, 30)

            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true) // Hide the back button
    }
}



