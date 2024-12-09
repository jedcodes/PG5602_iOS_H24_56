

import SwiftUI
import SwiftData

@main
struct The_Daily_PlanetApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .modelContainer(for: [Article.self, Category.self, Search.self, Country.self])
    }
    init() {
            print(URL.applicationSupportDirectory.path(percentEncoded: false))
        }
}
