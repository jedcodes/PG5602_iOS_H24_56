import SwiftUI

struct EmptyListView: View {
    var title: String
    var subtitle: String
    var imageName: String
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "\(imageName)")
                .resizable()
                .frame(width: 70, height: 70)
            Text(title)
                .font(Font.custom("Poppins-SemiBold", size: 22))
                .foregroundColor(Colors.TextColor)
                .multilineTextAlignment(.center)
            Text(subtitle)
                .font(Font.custom("Poppins-Regular", size: 18))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    EmptyListView(title: "Title", subtitle: "Sub Title", imageName: "bookmark.slash.fill")
}
