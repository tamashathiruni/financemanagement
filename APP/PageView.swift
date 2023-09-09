//
//  PageView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-11.
//

import SwiftUI

struct PageView: View {
    var page: Page
    
    var body: some View {
        VStack(spacing: 10) {
            // Display the image for the page
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
                .background(.gray.opacity(0.10))
                .cornerRadius(10)
                .padding()
            
            // Display the description of the page
            Text(page.name)
                .font(.title)
            Text(page.description)
                .font(.subheadline)
                .frame(width: 300)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    // Preview the PageView with a sample page
    static var previews: some View {
        PageView(page: Page.samplePage)
    }
}
