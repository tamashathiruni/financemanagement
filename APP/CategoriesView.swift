//
//  CategoriesView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-12.
//

import SwiftUI

struct CategoriesViwe: View {
    var body: some View {
        ZStack {
            // Background color
            Color.white
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("CategoriesViwe")
                    .font(.title)
                    .padding()
                    .foregroundColor(.black)

                // Add your chart here or any other content related to the chart view

                Spacer()
            }
        }
        //.navigationTitle("Chart View") // navigation title
    }
}

struct CategoriesViwe_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesViwe()
    }
}
