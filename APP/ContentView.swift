//
//  ContentView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-09.
//
import SwiftUI

struct ContentView: View {
    @State private var navigateToNextScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                
                if navigateToNextScreen {
                    NavigationLink(destination: NextView(), isActive: $navigateToNextScreen) {
                        EmptyView()
                    }
                    .hidden()
                }
                
                VStack {
                    Image("FirstImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Button(action: {
                        self.navigateToNextScreen = true
                    }) {
    
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    self.navigateToNextScreen = true
                }
            }
        }
    }
}



struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
