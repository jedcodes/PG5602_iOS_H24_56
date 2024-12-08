import SwiftUI

struct TabbarView: View {
    var body: some View {
           TabView {
               ArticleScreen()
                   .tabItem {
                       Label("My Articles", systemImage: "list.bullet.rectangle")
                   }
               SearchScreen()
                   .tabItem {
                       Label("Search", systemImage: "magnifyingglass")
                   }
               SettingScreen()
                   .tabItem {
                       Label("Settings", systemImage: "gearshape")
                   }
           }
       }
}

#Preview {
    TabbarView()
}
