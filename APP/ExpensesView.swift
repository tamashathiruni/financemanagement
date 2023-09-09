//
//  ExpensesView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-13.
//
import SwiftUI

struct ExpensesView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Use your custom color "mainColor" as the background color
                Color("maincolor").ignoresSafeArea(.all, edges: .all)
                
                VStack {
                    Spacer() // Push the tabs to the top
                    
                    Text("Expenses")
                        .font(.title)
                        .foregroundColor(.red) // Text color
                        .padding()
                    
                    HStack {
                        // Expenses Tab with red background
                        Button(action: {
                            // Handle Expenses Tab action
                        }) {
                            Text("Expenses")
                                .font(.title)
                                .foregroundColor(.white) // Text color
                                .padding()
                                .background(Color.red) // Background color
                                .frame(width: 200, height: 200)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        // Income Tab with white background and NavigationLink
                        NavigationLink(destination: IncomeView()) {
                            Text("Income")
                                .font(.title)
                                .foregroundColor(.black) // Text color
                                .padding()
                                .background(Color.white) // Background color
                                .frame(width: 200, height: 100)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
