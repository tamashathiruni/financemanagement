//
//  SignInView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-11.
//

import SwiftUI

struct SignInView: View {
    // Input fields
    @State private var email = ""
    @State private var password = ""
    @State private var navigateToSignUp = false // This state variable will control the navigation to the sign-up page
    @State private var navigateToHome = false // This state variable will control the navigation to the home page

    var body: some View {
        NavigationView { // Wrap the entire view in a NavigationView
            ZStack {
                // White background color for the entire view
                Color.white
                    .edgesIgnoringSafeArea(.all)

                // Pink border padding for the form
                Color.white
                    .cornerRadius(20)
                    .padding()
                    .shadow(color: .green, radius: 5, x: 2, y: 2)
                    .frame(width: 400, height: 500)

                VStack {
                    VStack(alignment: .leading) {
                        Text("SIGN IN")
                            .font(.title2)
                            .padding(.bottom, 20)

                        // Email TextField
                        Text("Email")
                            .font(.body)
                        TextField("", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(.green)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .frame(width: 350, height: 40)
                            .cornerRadius(2)

                        // Password SecureField
                        Text("Password")
                            .font(.body)
                        SecureField("", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(.green)
                            .frame(width: 350, height: 40)
                            .cornerRadius(2)
                            .padding(.bottom)
                        
                        NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                            Button("SIGN IN") {
                                // Your sign-in logic here
                                // You can check email and password against your authentication system
                                // Assuming successful login, activate the navigation to the home page
                                navigateToHome = true
                            }
                            .frame(width: 300, height: 40)
                            .buttonStyle(.bordered)
                            .padding(.horizontal, 1)
                            .padding(.vertical, 6)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(3)
                            .padding()
                        }
                        
                        // Text linking to Sign Up
                        Text("Don't have an account?")
                            .frame(width: 350, height: 40)

                        // "Sign Up" text with navigation
                        NavigationLink(
                            destination: SignUpView(),
                            isActive: $navigateToSignUp
                        ) {
                            Text("SIGN UP")
                                .font(.body)
                                .foregroundStyle(.red)
                                .frame(width: 350, height: 40)
                                .onTapGesture {
                                    // Activate navigation to the sign-up page
                                    navigateToSignUp = true
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .padding()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
