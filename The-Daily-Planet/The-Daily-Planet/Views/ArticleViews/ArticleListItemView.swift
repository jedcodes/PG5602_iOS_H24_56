
import SwiftUI

struct ArticleListItemView: View {
    var article: Article
    var body: some View {
        HStack(alignment: .center,spacing: 5) {
            let imageUrl = (!article.urlToImage.isEmpty) ? article.urlToImage : "https://placehold.co/400"
            NetworkImageView(imageUrl: imageUrl, radius: 10)
           
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(Font.custom("Poppins-Bold", size: 18))
                    .foregroundStyle(Colors.TextColor)
                
                Text(article.source)
                    .font(Font.custom("Poppins-Regular", size: 15))
                    .foregroundStyle(Colors.TextColor)
            }
        
        }
    }
}

#Preview {
    ArticleListItemView(article: SampleData.MockData)
}
