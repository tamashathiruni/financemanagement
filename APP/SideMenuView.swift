//
//  SideMenuView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-12.
//
import SwiftUI

struct SideMenuView: View {
    @State private var navigateToSignUp = false // This state variable will control the
    @State private var navigateToChartView = false // New state variable for navigation to ChartView
    @State private var navigateToCategoriesViwe = false // New state variable for navigation to ChartView
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .leading, spacing: 15) {
                // Profile Image
                Image("ProfileImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(50)
                    .padding(.top, 50)
                
                // Profile Name
                Text("Tamasha Thiruni")
                    .font(.title2)
                    .foregroundColor(.white)
                
                // Divider
                Divider()
                    .frame(width: 200, height: 2)
                    .background(Color.white)
                    .padding(.horizontal, 16)
                
                // Menu Items
                
                NavigationLink(destination: ChartView(), isActive: $navigateToChartView){
                    Text("Chart")
                        .font(.body)
                        .foregroundColor(.white)
                }
                
                NavigationLink(destination: CategoriesViwe(), isActive: $navigateToCategoriesViwe){
                    Text("Categories")
                        .font(.body)
                        .foregroundColor(.white)
                }
                
                Text("Settings")
                    .font(.body)
                    .foregroundColor(.white)
                
                Text("About Us")
                    .font(.body)
                    .foregroundColor(.white)
                
                NavigationLink(destination: SignUpView(), isActive: $navigateToSignUp) {
                    EmptyView()
                }
                
                Button("Log out") {
                    // Your sign-in logic here
                    // You can check email and password against your authentication system
                    //Assuming successful login, activate the navigation to the home page
                    navigateToSignUp = true
                }
                .frame(width: 100, height: 25)
                .buttonStyle(.bordered)
                .padding(.horizontal, 1)
                .padding(.vertical, 6)
                .background(.pink)
                .foregroundColor(.white)
                .cornerRadius(3)
                .padding(80)
                .padding(.top, 80)
            }
            
            Spacer() // Spacer to push content to the top
        }
        
        .padding(30) // Padding around the content
        .background(Color.gray) // Background color of the side menu
        .edgesIgnoringSafeArea(.bottom) // Ignore safe area for the bottom edge
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
