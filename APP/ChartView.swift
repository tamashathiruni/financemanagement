//
//  ChartView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-12.
//

import SwiftUI

struct ChartView: View {
    var body: some View {
        ZStack {
            // Background color
            Color.white
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("ChartView")
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

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

