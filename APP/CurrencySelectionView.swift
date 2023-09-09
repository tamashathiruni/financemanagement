//
//  CurrencySelectionView.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-28.
//

import SwiftUI

struct Country: Identifiable, Equatable { // Conform to Equatable
    let id = UUID()
    let name: String
    let currency: String

    static func == (lhs: Country, rhs: Country) -> Bool { // Implement the == operator
        return lhs.id == rhs.id
    }
}


struct CurrencySelectionView: View {
    @State private var selectedCountry: Country?
    @State private var isNextScreenActive = false
    @State private var showAlert = false
    @State private var searchText = ""

    let countries = [
             Country(name: "United States", currency: "USD"),
             Country(name: "European Union", currency: "EUR"),
             Country(name: "United Kingdom", currency: "GBP"),
             Country(name: "Canada", currency: "CAD"),
             Country(name: "South Africa", currency: "ZAR"),
             Country(name: "Australia", currency: "Australian dollar"),
             Country(name: "Chile", currency: "Chilean Peso"),
             Country(name: "China", currency: "Chinese Yuan"),
             Country(name: "Colombia", currency: "Colombian Peso"),
             Country(name: "Ethiopia", currency: "Birr"),
             Country(name: "Fiji", currency: "Fiji dollar"),
             Country(name: "France", currency: "Euro"),
             Country(name: "Icelande", currency: "Icelandic króna"),
             Country(name: "India", currency: "Indian Rupee"),
             Country(name: "Indonesia", currency: "Rupiah"),
             Country(name: "Iraq", currency: "Iraqi Dinar"),
             Country(name: "Iran", currency: "Rial"),
             Country(name: "Ireland", currency: "Euro"),
             Country(name: "Jamaica", currency: "Jamaican dollar"),
             Country(name: "Japan", currency: "Yen"),
             Country(name: "Kuwait", currency: "Kuwaiti Dinar"),
             Country(name: "Malaysia", currency: "Ringgit"),
             Country(name: "Maldives", currency: "Rufiyaa"),
             Country(name: "Mali", currency: "CFA Franc"),
             Country(name: "Nepal", currency: "Nepalese rupee"),
             Country(name: "Netherlands", currency: "Euro"),
             Country(name: "New Zealand", currency: "New Zealand dollar"),
             Country(name: "Norway", currency: "Norwegian krone"),
             Country(name: "Oman", currency: "Omani rial"),
             Country(name: "Pakistan", currency: "Pakistani rupee"),
             Country(name: "Palestine", currency: "Palestine Pound"),
             Country(name: "SriLanka", currency: "Rupees"),
    ]

    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
         NavigationView {
             VStack {
                 Text("Choose Your Default Country") // Change text font size
                     .font(.system(size: 20, weight: .bold)) // Adjust font size
                     .padding(.top)

                 SearchBar(text: $searchText)
                     .padding(.top)

                 List(filteredCountries) { country in
                     Button(action: {
                         selectedCountry = country
                     }) {
                         HStack {
                             Text(country.name)
                                 .font(.headline)
                                 .foregroundColor(selectedCountry == country ? Color.yellow : Color.primary)

                             Spacer()

                             Text(country.currency)
                                 .font(.subheadline)
                                 .foregroundColor(.secondary)
                         }
                     }
                 }
                 .listStyle(PlainListStyle()) // Use PlainListStyle for better scrolling behavior

                 NavigationLink("", destination: NextScreen(selectedCountry: $selectedCountry), isActive: $isNextScreenActive)
                     .opacity(0) // Hidden navigation link

                 Button(action: {
                     if selectedCountry != nil {
                         isNextScreenActive = true
                     } else {
                         showAlert = true
                     }
                 }) {
                     Text("Next")
                         .frame(width: 200, height: 50)
                         .background(selectedCountry != nil ? Color.yellow : Color.green)
                         .foregroundColor(.black)
                         .font(.headline)
                         .cornerRadius(10)
                 }
                 .disabled(selectedCountry == nil)
                 .padding()

                 Spacer()
             }
             .navigationTitle("") // Empty navigation title
             .navigationBarHidden(true) // Hide the navigation bar
             .alert(isPresented: $showAlert) {
                 Alert(
                     title: Text("Error"),
                     message: Text("Please select a country before proceeding."),
                     dismissButton: .default(Text("OK"))
                 )
             }
         }
     }
 }

struct NextScreen: View {
    @Binding var selectedCountry: Country?

    var body: some View {
        VStack {
            Text("Selected Country: \(selectedCountry?.name ?? "")")
                .font(.title)
                .padding()

            Text("Currency: \(selectedCountry?.currency ?? "")")
                .font(.title)
                .padding()

            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
        
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .accessibilityIdentifier("SearchBar")
        }
    }
}

struct CurrencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelectionView()
    }
}
