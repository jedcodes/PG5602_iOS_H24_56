import SwiftUI
import SwiftData

struct SettingScreen: View {
    @State var model:APICategoryStore
    @Query private var countries: [Country]
    @State private var selectedCategory: String = "general" // Default selection
    @State private var selectedCountry: String = "us"
    
    var body: some View {
        ZStack {
            Color(Colors.PrimaryBG)
                .ignoresSafeArea()
            NavigationStack {
                VStack {
                    Section {
                        
                        Toggle("Theme", isOn: .constant(true))
                    }
                    Spacer()
                    
                    Section(header: Text("Ticker Configution")) {
                        Picker("News Categories", selection: $selectedCategory) {
                            ForEach(model.apiCategories, id: \.self) { category in
                                Text(category.capitalized).tag(category)
                            }
                        }
                       
                    }
                    
                    Section(header: Text("Countries")) {
                        
                        Picker("Countries", selection: $selectedCountry) {
                            ForEach(countries, id: \.self) { country in
                                Text("\(country.countryCode.uppercased())").tag(country.countryCode)
                            }
                        }
                    }
                    Spacer()
                }
                .navigationTitle("Settings")
                .padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    SettingScreen(model: APICategoryStore())
}
