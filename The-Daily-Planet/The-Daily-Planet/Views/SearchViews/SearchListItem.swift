import SwiftUI

struct SearchResultView: View {
    let article: NewsArticle

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            // Async Image with URL Conversion and Error Handling
            if let imageUrl = article.urlToImage {
                            NetworkImageView(imageUrl: imageUrl, radius: 10)
                        } else {
                            // Placeholder image or fallback UI
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 80, height: 80)
                        }
            // Article Title and Source
            VStack(alignment: .leading, spacing: 5) {
                Text(article.title)
                    .font(Font.custom("Poppins-Bold", size: 16))
                    .foregroundColor(Colors.TextColor)

                Text(article.source.name)
                    .font(Font.custom("Poppins-Regular", size: 14))
                    .foregroundColor(Colors.TextColor)
            }
            .lineLimit(2) // Prevent text overflow
        }
        .padding(10)
    }
}

#Preview {
    SearchResultView(article: SampleData.MockDataTwo)
}
