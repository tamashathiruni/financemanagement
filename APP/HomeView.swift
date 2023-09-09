//
//  HomeView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-11.
//
import SwiftUI

struct HomeView: View {
    @State private var showMenu: Bool = false // State variable to control the visibility of the side menu
    @State private var selectedDate = Date()
    @State private var isDateSelected = false
    @State private var isImageHidden = false // State variable to control the visibility of the image
    
    var body: some View {
        NavigationView {
            ZStack {
                // Use your custom color "mainColor" as the background color
                Color("maincolor").ignoresSafeArea(.all, edges: .all)

                VStack {
                    HStack {
                        Button {
                            self.showMenu.toggle() // Toggle side menu visibility on button click
                            self.isImageHidden.toggle() // Toggle image visibility
                        } label: {
                            if showMenu {
                                Image(systemName: "xmark") // Close button when the menu is open
                                    .font(.title)
                                    .foregroundColor(.red)
                            } else {
                                Image(systemName: "text.justify") // Menu icon when the menu is closed
                                    .font(.title)
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.leading, 16)
                        
                        Spacer()
                        
                        DatePicker("", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                            .padding(.horizontal)
                            .labelsHidden()
                            .onChange(of: selectedDate) { newValue in
                                isDateSelected = true
                            }
                            .frame(maxWidth: .infinity, alignment: .topTrailing) // Center the DatePicker horizontally
                    }
                    .padding(.bottom, 659)
                }
                
                HStack {
                    NavigationLink(destination: IncomeView()) {
                        Text("Income")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 100)
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
                            .frame(width: 150, height: 100)
                            .background(Color.red)
                            .cornerRadius(8)
                            .padding(.leading, 2)
                            .padding()
                        
                    }
                    
                }
                .padding(.bottom, 450)
                
                Spacer()
                
                if showMenu {
                    SideMenuView() // Display the side menu
                        .frame(width: UIScreen.main.bounds.width * 0.7)
                        .background(Color.black.opacity(0.7))
                        .offset(x: 0)
                        .animation(.easeInOut(duration: 0.4))
                }
                
                Spacer()
                
                if !isImageHidden {
                    Image("HomeEmpty")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .cornerRadius(30)
                        .opacity(0.6)
                        .padding(.top, 50)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
