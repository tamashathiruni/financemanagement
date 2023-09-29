//
//  NextView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-26.
//

import SwiftUI

struct ContentView1: View {
    var body: some View {
        NavigationView {
            NextView()
                .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct NextView: View {
    @State private var isCurrencySelectionViewActive = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up to Save Your Information")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                .padding(.top, 30)

            Button(action: {
                // Handle Sign In
            }) {
                Text("Sign In")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: {
                // Handle Sign Up
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Text("Log in with")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.black)
                .padding(.top, 30)

            HStack(spacing: 20) {
                Button(action: {
                    // Handle Login with Facebook
                }) {
                    Image("facebook") // Replace with your Facebook logo image asset
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }

                Button(action: {
                    // Handle Login with Google
                }) {
                    Image("google") // Replace with your Google logo image asset
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 50)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
            }

            Button(action: {
                // Continue without creating an account
                self.isCurrencySelectionViewActive = true
            }) {
                Text("Continue without creating an account")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
            }
            .background(
                NavigationLink("", destination: CurrencySelectionView(), isActive: $isCurrencySelectionViewActive)
                    .opacity(0)
            )

            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct CurrencySelectionView1: View {
    var body: some View {
        Text("Currency Selection View")
            // Add your currency selection UI here
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
