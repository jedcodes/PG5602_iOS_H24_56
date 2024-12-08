import SwiftUI

struct SearchDetailView: View {
    let article: NewsArticle
    @State private var showBottomSheet = false
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    NetworkImageView(imageUrl: article.urlToImage!, radius: 0)
                    
                    Text(article.title)
                        .font(Font.custom("Poppins-Bold", size: 20))
                        .padding(.vertical, 10)
                    
                    Text(article.description)
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Poppins-Regular", size: 16))
                    
                    HStack(spacing: 30) {
                        VStack {
                            Text("Author")
                                .font(Font.custom("Poppins-SemiBold", size: 16))
                            Text(article.author!)
                                .font(Font.custom("Poppins-Regular", size: 16))
                        }
                        
                        VStack {
                            Text("Source")
                                .font(Font.custom("Poppins-SemiBold", size: 16))
                            Text(article.source.name)
                                .font(Font.custom("Poppins-Regular", size: 16))
                        }
                    }
                    .padding()
                    
                    Text(article.content!)
                        .font(Font.custom("Poppins-Regular", size: 16))
                        .multilineTextAlignment(.center)
                }
                
            }
            
            Spacer()
            
            HStack {
                DetailButtonView(action: {showBottomSheet.toggle()}, buttonTitle: "Save Article")
                    .sheet(isPresented: $showBottomSheet) {
                        BottomSheetView(article: article)
                            .presentationDetents([ .large])
                    }
                
                
                DetailButtonView(action: {print("View more")}, buttonTitle: "View More")
            }
            .padding()
        }
        .background(Colors.PrimaryBG)
    }
}

#Preview {
    SearchDetailView(article: SampleData.MockDataTwo)
}
