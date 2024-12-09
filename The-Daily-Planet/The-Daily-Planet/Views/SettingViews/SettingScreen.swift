import SwiftUI
import SwiftData

struct SettingScreen: View {
    @State var model:APICategoryStore
    @Query private var countries: [Country]
    @State private var selectedCategory: String = "general" // Default selection
    @State private var selectedCountry: String = "us"
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false // Persistent state for theme
    @Environment(\.colorScheme) private var colorScheme // Tracks current system color
    @Environment(\.colorSchemeContrast) private var contrast
    
    var body: some View {
        ZStack {
            Color(Colors.PrimaryBG)
                .ignoresSafeArea()
            NavigationStack {
                VStack {
                    Form {
                        Section(header: Text("Appearance")) {
                            Toggle("Dark Mode", isOn: $isDarkMode)
                        }
                        Section(header: Text("Ticker Configution")) {
                            Picker("News Categories", selection: $selectedCategory) {
                                ForEach(model.apiCategories, id: \.self) { category in
                                    Text(category.capitalized).tag(category)
                                }
                            }
                            
                            Picker("Countries", selection: $selectedCountry) {
                                ForEach(countries, id: \.self) { country in
                                    Text("\(country.countryCode.uppercased())").tag(country.countryCode)
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                .navigationTitle("Settings")
            }
        }
    }
}

#Preview {
    SettingScreen(model: APICategoryStore())
}
