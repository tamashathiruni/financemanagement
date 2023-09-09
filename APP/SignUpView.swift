//
//  SignUpView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-11.
//

import SwiftUI

struct SignUpView: View {
    // Input fields and validation states
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isNameValid = false
    @State private var isEmailValid = false
    @State private var isPasswordValid = false
    @State private var showAlert = false
    @State private var navigateToSignIn = false // This state variable will control the navigation

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
                    .frame(width: 400, height: 600)

                VStack(alignment: .leading) { // Align the content to the left

                    Text("SIGN UP")
                        .font(.title2)
                        .padding(.bottom, 20)

                    // Name TextField
                    Text("Name")
                        .font(.body)
                    
                    TextField("", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.green)
                        .autocapitalization(.words)
                        .cornerRadius(3)
                        .onChange(of: name) { newValue in
                            isNameValid = isValidName(name: newValue)
                        }
                        .frame(width: 350, height: 40)

                    // Email TextField
                    Text("Email")
                        .font(.body)
                    
                    TextField("", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.green)
                        .cornerRadius(3)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .onChange(of: email) { newValue in
                            isEmailValid = isValidEmail(email: newValue)
                        }
                        .frame(width: 350, height: 40)

                    // Password SecureField
                    Text("Password")
                        .font(.body)
                    
                    SecureField("", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.green)
                        .cornerRadius(3)
                        .onChange(of: password) { newValue in
                            isPasswordValid = isValidPassword(password: newValue)
                        }
                        .frame(width: 350, height: 40)

                    Button("Sign Up") {
                        if isNameValid && isEmailValid && isPasswordValid {
                            // Your signup logic here
                            showAlert = true
                        } else {
                            showAlert = true
                        }
                        
                    }
                    
                    .frame(width: 300, height: 40)
                    .buttonStyle(.bordered)
                    .padding(.horizontal, 1)
                    .padding(.vertical, 6)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(3)
                    .disabled(!(isNameValid && isEmailValid && isPasswordValid))
                    .padding()
                    
                    
                    // Text linking to Sign In page
                    Text("Already have an account?")
                        .frame(width: 350, height: 40)

                    // "Sign In" text with navigation
                    Text("Sign In")
                        .font(.body)
                        .foregroundStyle(.red)
                        .frame(width: 350, height: 40)
                        .onTapGesture {
                            navigateToSignIn = true // Activate navigation
                        }
                }
                .padding(.horizontal, 20) // Add horizontal padding to the entire content
            }
            .padding()
            .alert(isPresented: $showAlert) {
                // Alert displaying signup status
                Alert(
                    title: Text("Signup Status"),
                    message: Text("Name: \(name)\nEmail: \(email)\nPassword: \(password)"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .background(
            NavigationLink(destination: SignInView(), isActive: $navigateToSignIn) {
                EmptyView()
            }
        ) // This NavigationLink will navigate to SignInView when navigateToSignIn is true
    }

    // Function to validate the name
    func isValidName(name: String) -> Bool {
        // Implement your name validation logic here
        // Example: return name.count >= 2
        return true
    }

    // Function to validate the email
    func isValidEmail(email: String) -> Bool {
        // Implement your email validation logic here
        // Example: return email.count > 5 && email.contains("@")
        return true
    }

    // Function to validate the password
    func isValidPassword(password: String) -> Bool {
        // Implement your password validation logic here
        // Example: return password.count >= 6
        return true
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
