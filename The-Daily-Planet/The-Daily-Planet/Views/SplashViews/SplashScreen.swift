import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color(Colors.PrimaryBG)
                .ignoresSafeArea()
            
            Image("daily")
                .resizable()
                .aspectRatio(contentMode: .fit)
               
        }
    }
}

#Preview {
    SplashScreen()
}
