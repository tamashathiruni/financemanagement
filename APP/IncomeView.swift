//
//  IncomeView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-13.
//

import SwiftUI

struct IncomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Use your custom color "mainColor" as the background color
                Color("maincolor").ignoresSafeArea(.all, edges: .all)
                
                VStack {
                    Text("Income")
                        .font(.title)
                        .foregroundColor(Color.green)
                        .padding()
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: IncomeView()) {
                            Text("Income")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50)
                                .background(Color.green)
                                .cornerRadius(8)
                                .padding(.leading, 2)
                                .padding()
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: ExpensesView()) {
                            Text("Expenses")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50)
                                .background(Color.red)
                                .cornerRadius(8)
                                .padding(.leading, 2)
                                .padding()
                        }
                    }
                    .padding(.bottom, 600)
                    
                    Spacer()
                }
            }
        }
    }
}

struct IncomeView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeView()
    }
}
