

import SwiftUI
import SwiftData

@main
struct The_Daily_PlanetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Article.self, Category.self, Search.self, Country.self])
    }
    init() {
            print(URL.applicationSupportDirectory.path(percentEncoded: false))
        }
}
