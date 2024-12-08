import SwiftUI

struct ArticleDetailScreen: View {
    let article: Article
   
    var body: some View {
        ScrollView {
            
            let imageUrl = (!article.urlToImage.isEmpty) ? article.urlToImage : "https://placehold.co/400"
            NetworkImageView(imageUrl: imageUrl, radius: 0)
                    
                    VStack {
                        Text(article.title)
                            .font(.system(size: 20, weight: .semibold))
                        Text(article.articleDescription)
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        HStack (spacing: 30) {
                            VStack {
                                Text("Author")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Text(article.author)
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                Text("Source")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Text(article.source)
                                    .fontWeight(.semibold)
                            }


                        }
                        
                        Text(article.content)
                            .multilineTextAlignment(.center)
                            .padding()


                    }
            
        }
        HStack {
            Button {
                
            } label: {
                Text("Save Article")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 150, height: 50)
                    .foregroundStyle(.white)
                    .background(Color(Colors.ButtonBG))
                    .cornerRadius(10)
            }
            Button {
                print("Read more")
            } label: {
                Text("Read more")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 150, height: 50)
                    .foregroundStyle(.white)
                    .background(Color(Colors.ButtonBG))
                    .cornerRadius(10)
            }
        }
        .padding(.vertical, 20)
        
    }
}

#Preview {
    ArticleDetailScreen(article: SampleData.MockData)
}
